import React, { useState } from 'react';
import { Redirect } from 'react-router-dom';
import { connect } from 'react-redux';
import { verify } from '../actions/auth';

const Compra = (props) => {
    const [compra, setCompra] = useState(false);

    const compra_account = e => {
        setCompra(true);
    };

    if (compra)
        return <Redirect to='/' />
    return (
        <div className='container'>
            <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', flexDirection: 'column',marginTop: '200px' }}>
                <h1>Comfirmación de tu compra:</h1>
                <button 
                    onClick={compra_account}
                    style={{ marginTop: '50px' }}
                    type="button"
                    className="btn btn-primary"
                >
                 COMPRAR 
                </button>
            </div>
        </div>
    );
};

export default (Compra);
