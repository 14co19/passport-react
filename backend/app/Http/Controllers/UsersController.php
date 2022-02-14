<?php

namespace App\Http\Controllers;

use Auth;
use DB;
use Validator;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class UsersController extends Controller
{
    protected $user;

    public function __construct() {
        $this->middleware("auth:api", ["except" => ["login", "register"]]);
        $this->user = new User();
    }

    public function register(Request $request){

        $validator = Validator::make($request->all(),[
            'name' => 'required|string',
            'email' => 'required|string|unique:users',
            'role' => 'required|string',
            'password' => 'required|min:6',
        ]);

        if($validator->fails()){
            return response()->json([
                'success' => false,
                'message' => $validator->messages()->toArray()
            ], 500);
        }

        $data = [
            "name" => $request->name,
            "email" => $request->email,
            "role" => $request->role,
            "password" => \Hash::make($request->password)
        ];

        $this->user->create($data);

        $responseMessage = "Registration Successful";
        return response()->json([
            'success' => true,
            'message' => $responseMessage
        ], 200);
    }

    public function login(Request $request) {
        $data = [];

        \Log::info($request);

        $validator = Validator::make($request->all(), [
            'email' => 'required|string',
            'password' => 'required|min:6'
        ]);

        if($validator->fails()) {
            return response()->json([
                'success' => false,
                'data' => null,
                'token' => null,
                'error' => $validator->messages()->toArray(),
                'code' => 500
            ], 500);
        }

        $userData = [
            'email' => $request->email,
            'password' => $request->password
        ];

        $user = User::where('email', $userData['email'])->first();

        if($user) {
            if(!auth()->attempt($userData)) {
                return response()->json([
                    'success' => false,
                    'data' => null,
                    'token' => null,
                    'error' => 'Invalid Email Id or Password.',
                    'code' => 422
                ], 422);
            }
            
            $accessToken = $this->getAccessToken($user->email, $userData['password']);

            if($user->role == 'banker') {
                $users = User::where('role', 'customer')->get();
                $data['customers'] = $users;
                $data['banker'] = auth()->user();
                $data['role'] = auth()->user()->role;
            } else {
                $transactions = DB::table('accounts')->where('user_id', $user->id)->first();
                $data['user'] = auth()->user();
                $data['transaction'] = $transactions;
                $data['role'] = auth()->user()->role;
            }

            return $this->respondWithToken($data, $accessToken['access_token'], 200);
        } else {
            return response()->json([
                'success' => false,
                'data' => null,
                'token' => null,
                'error' => "User not found!",
                'code' => 422
            ], 422);
        }

    }

    public function credit(Request $request) {
        $userData = [
            'user_id' => $request->user_id,
            'credit' => $request->credit,
            'comment' => $request->comment,
            'balance' => $request->balance
        ];

        $userData['balance'] = $userData['credit']+$userData['balance'];

        DB::table('accounts')->insert([
            'user_id' => $userData['user_id'],
            'transactions' => $userData['comment'],
            'credited' => $userData['credit'],
            'balance' => $userData['balance'],
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        // DB::table('accounts')->where('user_id', $userData['user_id'])->update(['balance' => $userData['balance']]);

        $usertransactions = DB::table('accounts')->where('user_id', $userData['user_id'])->orderBy('created_at', 'DESC')->get()->toArray();

        $this->respondWithToken($usertransactions, Auth::user()->access_token, 200);
    }

    public function debit(Request $request) {
        $userData = [
            'user_id' => $request->user_id,
            'debit' => $request->credit,
            'comment' => $request->comment,
            'balance' => $request->balance
        ];

        $balTrans = DB::table('accounts')->select('balance')
            ->where('user_id', $userData['user_id'])
            ->orderBy('created_at', 'DESC')
            ->limit(1)->get();

        if($balTrans->balance < 10) {
            return response()->json([
                'success' => true,
                'data' => null,
                'token' => null,
                'error' => "Insufficient Balance!",
                'code' => 422
            ], 422);
        } else {
            $userData['balance'] = $userData['balance']-$userData['debit'];

            DB::table('accounts')->insert([
                'user_id' => $userData['user_id'],
                'transactions' => $userData['comment'],
                'debited' => $userData['debit'],
                'balance' => $userData['balance'],
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            // DB::table('accounts')->where('user_id', $userData['user_id'])->update(['balance' => $userData['balance']]);

            $usertransactions = DB::table('accounts')->where('user_id', $userData['user_id'])->orderBy('created_at', 'DESC')->get()->toArray();

            $this->respondWithToken($usertransactions, Auth::user()->access_token, 200);
        }
        
    }

    public function userslist(Request $request) {

        $usersData = User::all();

        if(!$usersData) {
            return response()->json([
                'success' => true,
                'data' => "No Users found.",
                'token' => null,
                'error' => null,
                'code' => 200
            ], 200);
        }

        return response()->json([
            'success' => true,
            'data' => $userData,
            'token' => auth()->user()->token,
            'error' => null,
            'code' => 200
        ], 200);
    }

    public function transactions(Request $request) {
        $usertransactions = DB::table('accounts')->where('user_id', $request->user_id)->get()->toArray();

        if($usertransactions) {
            return response()->json([
                'success' => true,
                'data' => $usertransactions,
                'name' => auth()->user()->name,
                'token' => auth()->user()->token,
                'error' => null,
                'code' => 200
            ], 200);
        } else {
            return response()->json([
                'success' => true,
                'data' => null,
                'name' => auth()->user()->name,
                'token' => auth()->user()->token,
                'error' => null,
                'code' => 200
            ], 200);
        }
    }

    public function logout(Request $request) {

        $user = Auth::guard("api")->user()->token();
        $user->revoke();

        return response()->json([
            'success' => true,
            'data' => "Successfully Logout",
            'token' => null,
            'error' => null,
            'code' => 200
        ], 200);
    }

    public function respondWithToken($data, $token, $code) {
        return response()->json([
            'success' => true,
            'data' => $data,
            'token' => $token,
            'error' => null,
            'code' => $code
        ], $code);
    }

    public function getAccessToken($email, $password) {
        $response = Http::post("http://127.0.0.10:8000/oauth/token", [
            'grant_type' => 'password',
            'client_id' => 2,
            'client_secret' => 'zSrAk8QX5VExONOzSdYNHeKJqSfdSUM3j7FTj9ca',
            'username' => $email,
            'password' => $password,
            'scope' => '',
        ]);
         
        return $response->json();
    }
}
