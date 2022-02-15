import React, { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";

function Transaction() {
    const params = useParams()
    const id = params.id;

    const [transData, setTrans] = useState([]);
    // const navigate = useNavigate()

    useEffect( () => {
        if(localStorage.getItem('transaction'+id)) {
            let trans = JSON.parse(localStorage.getItem('transaction'+id));
            setTrans(trans)
        }
    }, [])

    return (
        <>
        <h3>{transData.name} {console.log(transData)} Transactions</h3>
        <Link to={'/banker'} style={{color: '#000000', textDecoration: 'none', margin: '20px 0', fontSize: '16px' }} >Go Back</Link>
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
                (transData.data !== null && transData.data !== undefined ) 
                ? (transData.data.map( (item) => {
                    return <tr key={item.id}>
                        <td>{item.transactions}</td>
                        <td>{item.credited}</td>
                        <td>{item.debited}</td>
                        <td>{item.balance}</td>
                    </tr>
                })
                )
                : (<tr><td>Transactions Not Found!</td></tr>)
            }
            </tbody>
        </table>
        </>
    );
}

export default Transaction;