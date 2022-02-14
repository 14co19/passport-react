import { useState } from 'react';

function useUser() {
    const getUser = () => {
        const user = localStorage.getItem('userData')
        const userData = JSON.parse(user);
        return userData    
    }

    const [user, setUser] = useState(getUser());

    const saveUser = (user) => {
        localStorage.setItem('userData', JSON.stringify(user))
    }

    return {
        setUser: saveUser,
        user,
    }
}

export default useUser;