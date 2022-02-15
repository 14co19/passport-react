import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";

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

function Customer() {
    const [custTrans, setCustomerTrans] = useState([]);
    const navigate = useNavigate()
    
    useEffect( () => {
        const cust = JSON.parse(localStorage.getItem('userData')).data
        const token = localStorage.getItem('token')

        if(token) {
            if (cust.role !== 'customer') {
                return navigate('/banker')
            }
            getTransaction(cust.user.id)

            if(localStorage.getItem('transaction'+cust.user.id)) {
                let trans = JSON.parse(localStorage.getItem('transaction'+cust.user.id));
                setCustomerTrans(trans)
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
        }
    }

    return(
        <div>
            <h2>Customer Page</h2>
            <h3>List of Transactions</h3>
            <table>
                <thead>
                    <tr>
                    <td>Transactions</td>
                    <td>Deposited</td>
                    <td>Withdrawn</td>
                    <td>Balance</td>
                    </tr>
                </thead>
                <tbody>
                {
                    (custTrans.data !== null && custTrans !== undefined)
                    ? (custTrans.map( (item) => {
                        return <tr onClick={() => getTransaction(item.id)} key={item.id}>
                                <td>{item.name}</td>
                                <td>{item.email}</td>
                                <td>{item.role}</td>
                            </tr>
                        })
                    )
                    : (<tr><td>No Transaction found!</td></tr>)
                }
                </tbody>
            </table>
            <div className="btns">
                <button className="btn">Deposit</button>
                <button className="btn">Withdraw</button>
            </div>
        </div>
    );
}

export default Customer;