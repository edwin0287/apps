import React, { Fragment } from 'react';
import { Link, NavLink } from 'react-router-dom';
import { connect } from 'react-redux';
import { logout } from '../actions/auth';

const navbar = ({ isAuthenticated, logout }) => {
    const authLinks = (
        <li className="nav-item">
            <a className='nav-link' onClick={logout} href='#!'>Cerrar sesión</a>
        </li>
    );

    const guestLinks = (
        <Fragment>
            <li className="nav-item">
                <NavLink className="nav-link" exact to='/login'>Iniciar Sesión</NavLink>
            </li>
            <li className="nav-item">
                <NavLink className="nav-link" exact to='/signup'>Regístrate</NavLink>
            </li>
        </Fragment>
    );

    return (
        <nav className="navbar navbar-expand-lg navbar-light bg-light">
            <Link className="navbar-brand" to='/'>Teatro Web</Link>
            <button 
                className="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarNav"
                aria-controls="navbarNav"
                aria-expanded="false"
                aria-label="Toggle navigation"
            >
                <span className="navbar-toggler-icon"></span>
            </button>
            <div className="collapse navbar-collapse" id="navbarNav">
                <ul className="navbar-nav">
                    <li className="nav-item">
                        <NavLink className="nav-link" exact to='/'>Inicio</NavLink>
                    </li>
                    <li className="nav-item">
                        <NavLink className="nav-link" exact to='/demo'>Demo</NavLink>
                    </li>
                    { <Fragment>{ isAuthenticated ? authLinks : guestLinks }</Fragment> }
                </ul>
            </div>
        </nav>
    );
};

const mapStateToProps = state => ({
    isAuthenticated: state.auth.isAuthenticated
});

export default connect(mapStateToProps, { logout })(navbar);
