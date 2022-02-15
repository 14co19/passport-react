import React from 'react';
import './App.css';
import { Routes, Route, useNavigate } from 'react-router-dom';
import Banker from './components/dashboards/Banker';
import Customer from './components/dashboards/Customer';
import Login from './components/pages/Login';
import Transaction from './components/pages/Transactions';

function App() {
  const navigate = useNavigate();

  const logout = () => {
    localStorage.clear()
    navigate('/')
  }

  if(!localStorage.getItem('token')) {
    return <Login />
  }

  return (
      <>
      <div className='header'>
        <h1>Banker System</h1>
        <span className='logout' onClick={logout}>Logout</span>
      </div>
        <Routes>
          <Route path='/' element={<Login />}></Route>
          <Route path='/banker' element={<Banker />}></Route>
          <Route path='/customer' element={<Customer />}></Route>
          <Route path='/customer/transactions/:id' element={<Transaction />}></Route>
        </Routes>
        </>
  );

}

export default App;
