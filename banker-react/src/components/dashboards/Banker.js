import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

async function transApi(credentials) {
    return fetch('http://localhost:8000/api/users/transactions', {
        method: 'POST',
        headers: {
            'Content-Type': "application/json",
            "Accept": "application/json",
            "Authorization": 'Bearer '+localStorage.getItem('token')
        },
        body: JSON.stringify(credentials),
    })
    .then((res) => res.json())
    .catch( (err) => {
        return err
    });
}

function Banker() {
    const [customer, setCustomer] = useState([]);
    const navigate = useNavigate()

    useEffect( () => {
        const role = JSON.parse(localStorage.getItem('userData')).data.role
        const token = localStorage.getItem('token')
        if(token) {
            if (role !== 'banker') {
                return navigate('/customer')
            }

            if(localStorage.getItem('userData')) {
                let user = JSON.parse(localStorage.getItem('userData'));
                setCustomer(user.data.customers)
            }
        } else {
            return navigate('/')
        }

    },[])

    const getTransaction = async (id) => {
        const transactions = await transApi({id});
        if(!transactions.success){
            console.log(transactions.error)
        } else {
            localStorage.setItem('transaction'+id, JSON.stringify(transactions))
            navigate(`/customer/transactions/${id}`)
        }
    }

    return(
        <div className="content">
            <h2>Banker Page</h2>
            <h3>List of Customers</h3>
            <table>
                <thead>
                    <tr>
                        <td>Name</td>
                        <td>Email Id</td>
                        <td>Role</td>
                    </tr>
                </thead>
                <tbody>
                {
                    customer.map( (item) => {
                        return <tr onClick={() => getTransaction(item.id)} key={item.id}>
                            <td>{item.name}</td>
                            <td>{item.email}</td>
                            <td>{item.role}</td>
                        </tr>
                    })
                }
                </tbody>
            </table>
        </div>
    );
}

export default Banker;