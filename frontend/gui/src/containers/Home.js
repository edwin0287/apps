import React from 'react';
import { Link } from 'react-router-dom';

const home = () => (
    <div className='container'>
        <div className="jumbotron mt-5">
            <h1 className="display-4">Bienvenido!</h1>
            <p className="lead"></p>
            <hr className="my-4" />
            <p></p>
            <Link className="btn btn-primary btn-lg" to='/login' role="button">Iniciar Sesión</Link>
        </div>
    </div>
);

export default home;
