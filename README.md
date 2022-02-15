# passport-react

It is a simple Banker System created in Laravel and React with Laravel's Passport Token based Authentication.

How to Run

**Step 1**

Setup Apache or nginx server for Laravel
Setup npm for React

Clone the repo using below link
```link
https://github.com/14co19/passport-react.git
```
Go to the root folder and open terminal or cmd line

**For Laravel**
To install the dependencies

run below cmds from root dir
```cmd
cd backend
composer insatll
```

**For React**
To install dependencies

run below cmds from root dir
```cmd
cd  banker-react
npm install
```



**Step 2**
Start local server for Laravel & react

**For Laravel**
Open two terminal or cmd line from backend dir

One for laravel, run below cmd to start the local server
```cmd
php artisan serve
```
Second for passport, run below cmd to start local server for passport to generate Auth token
```cmd
php artisan serve --host=127.0.0.10
```

**For React**
Open terminal or cmd line from ./banker-react dir
run below cmd to start the local server
```cmd
npm start
```



**Step 3**
Open and Check the local servers in your Brower.

