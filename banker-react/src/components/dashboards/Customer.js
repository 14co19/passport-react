import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import Modal from '../pages/Modal';

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

function Customer() {
    const [custTrans, setCustomerTrans] = useState([]);
    const [modal, setModal] = useState(false);
    const [bal, setBal] = useState(0);

    const Toggle = () => setModal(!modal)

    const navigate = useNavigate()
    
    useEffect( () => {
        const cust = JSON.parse(localStorage.getItem('userData')).data
        const token = localStorage.getItem('token')

        if(token) {
            if (cust.role !== 'customer') {
                return navigate('/banker')
            }
            getTransaction(cust.user.id)

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
            setBal(transactions.data[0].balance)
            setCustomerTrans(transactions.data)
        }
    }

    return(
        <div className="content">
            <h2>Customer Page</h2>
            <div>
                <h3>List of Transactions</h3>
                <p>Bal: {bal} Rs.</p>
            </div>
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
                    (custTrans !== null && custTrans !== undefined)
                    ? (custTrans.map( (item) => {
                        return <tr key={item.id}>
                                <td>{item.transactions}</td>
                                <td>{(item.credited) ? item.credited : '-'}</td>
                                <td>{(item.debited) ? item.debited : '-'}</td>
                                <td>{item.balance}</td>
                            </tr>
                        })
                    )
                    : (<tr><td>No Transaction found!</td></tr>)
                }
                </tbody>
            </table>
            <div className="btns">
                <button className="btn" onClick={() => Toggle()} >Deposit</button>
                <button className="btn" onClick={() => Toggle()} >Withdraw</button>
            </div>
            <Modal show={modal} close={Toggle} bal={bal} />
        </div>
    );
}

export default Customer;