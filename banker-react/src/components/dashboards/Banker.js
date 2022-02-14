import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
// import Transaction from "../pages/Transactions";

async function transApi(credentials) {
    console.log(credentials)
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
        if(localStorage.getItem('userData')) {
            let user = JSON.parse(localStorage.getItem('userData'));
            setCustomer(user.data.customers)
        }
    },[])

    const getTransaction = async (id) => {
        const transactions = await transApi({id});
        if(!transactions.success){
            console.log(transactions.error)
        } else {
            localStorage.setItem('transanction'+id, JSON.stringify(transactions))
            navigate(`/customer/transactions/${id}`)
        }
    }

    return(
        <div>
            <h2>Customers</h2>
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