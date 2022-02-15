import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";

async function credit(credentials) {
    return fetch('http://localhost:8000/api/users/credit', {
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

async function debit(credentials) {
    return fetch('http://localhost:8000/api/users/debit', {
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

function Modal({ show, close , bal }) {
    const [amount, setAmount] = useState();
    const [comment, setComment] = useState();

    const navigate = useNavigate();

    const handleCreditSubmit = async (e) => {
        e.preventDefault();

        let user = JSON.parse(localStorage.getItem('userData')).data.user
        const transactions = await credit({
            'user_id': user.id,
            "credit": amount,
            comment,
            "balance": bal
        });
        if(!transactions.success){
            console.log(transactions.error)
        } else {
            let user = JSON.parse(localStorage.getItem('userData')).data.user
            localStorage.setItem('transaction'+user.id, JSON.stringify(transactions))
            navigate('/banker')
            close()
        }
    }

    const handleDebitSubmit = async (e) => {
        e.preventDefault();
        let user = JSON.parse(localStorage.getItem('userData')).data.user

        const transactions = await debit({
            "user_id": user.id,
            "debit": amount,
            comment,
            "balance": bal
        });
        if(!transactions.success){
            console.log(transactions.error)
        } else {
            let user = JSON.parse(localStorage.getItem('userData')).data.user
            localStorage.setItem('transaction'+user.id, JSON.stringify(transactions))
            navigate('/banker')
            close()
        }
    }

    return (
        <>
        {
            show
            ? <div className="modal-container">
                <div className="modal-content">
                    <div className="modal-header">
                        <h3>Create Transaction</h3>
                        <button className="close" onClick={() => close()}>X</button>
                    </div>
                    <div className="modal-body-content">
                        <form  >
                            <input type={'number'} placeholder={'Amount'} onChange={e => setAmount(e.target.value)} />
                            <input type={'text'} placeholder={'Comment'} onChange={e => setComment(e.target.value)} />

                            <div className="modal-btns">
                                <button onClick={handleCreditSubmit} type="submit" className="modalBtn">Deposit</button>
                                <button onClick={handleDebitSubmit} type="submit" className="modalBtn">Withdraw</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            : null
        }
        </>
    )
}

export default Modal;