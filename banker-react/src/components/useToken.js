import { useState } from 'react';

function useToken() {
    const getToken = () => {
        const token = localStorage.getItem('token')
        const userToken = JSON.parse(token);
        return userToken?.token
    }

    const [token, setToken] = useState(getToken());

    const saveToken = (token) => {
        localStorage.setItem('token', JSON.stringify(token))
    }

    return {
        setToken: saveToken,
        token,
    }
}

export default useToken;