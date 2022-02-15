import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
// import PropTypes from "prop-types";

async function userLogin(credentials) {
    return fetch('http://localhost:8000/api/users/login', {
        method: 'POST',
        headers: {
            'Content-Type': "application/json",
            "Accept": "application/json"
        },
        body: JSON.stringify(credentials),
    })
    .then((res) => res.json())
    .catch( (err) => {
        return err
    });
}

function Login() {
    const [email, setEmail] = useState();
    const [password, setPassword] = useState();

    const navigate = useNavigate();

    useEffect( () => {
        if(localStorage.getItem('token')) {
            if( localStorage.getItem('userData') ) {
                if (JSON.parse(localStorage.getItem('userData')).data.role === 'banker') {
                    navigate('/banker')
                } else {
                    navigate('/customer')
                }
            }
        } else {
            navigate('/')
        }

    })

    const handleSubmit = async (e) => {
        e.preventDefault();

        const userData = await userLogin({
            email,
            password
        });
        if(!userData.success){
            console.log(userData.error)
        } else {
            localStorage.setItem('token', userData.token)
            localStorage.setItem('userData', JSON.stringify(userData))
            if(userData.data.role === 'banker') {
                navigate('/banker')
            } else {
                navigate('/customer')
            }
        }
    }

    return(
        <div className="loginWrapper">
            <h2>LOG IN</h2>
            <form onSubmit={handleSubmit}>
                <input type="text" placeholder="Email Id" onChange={e => setEmail(e.target.value)} />
                <input type="password" placeholder="Password" onChange={e => setPassword(e.target.value)} />
                <button className="loginBtn" type="submit">Login</button>
            </form>
        </div>
    );
}

export default Login;
