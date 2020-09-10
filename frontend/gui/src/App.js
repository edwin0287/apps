import React from 'react';
import { BrowserRouter as Router,Route, Switch} from 'react-router-dom';
import Home from './containers/Home';
import Login from './containers/Login';
import Signup from './containers/Signup';
import Activate from './containers/Activate';
import ResetPassword from './containers/ResetPassword';
import ResetPasswordConfirm from './containers/ResetPasswordConfirm';
import demo from './containers/demo';
import List from './containers/ArticleListView';

import ListDetail from './containers/ArticleDetailView';

import TicketList from './containers/TicketListView';

import Compra from './containers/compra';

import { Provider } from 'react-redux';
import store from './store';

import Layout from './hocs/Layout';

import 'antd/dist/antd.css';

const App = () => (
    <Provider store={store}>
        <Router>
            <Layout>
            <Switch>
                    <Route exact path='/' component={Home} />
                    <Route exact path='/list' component={List}/>
                    <Route exact path='/compra' component={Compra}/>
                    <Route exact path='/list/:id/' component={ListDetail}/>
                    <Route exact path='/demo' component={demo} />
                    <Route exact path='/ticket' component={TicketList} />
                    <Route exact path='/login' component={Login} />
                    <Route exact path='/signup' component={Signup} />
                    <Route exact path='/reset_password' component={ResetPassword} />
                    <Route exact path='/password/reset/confirm/:uid/:token' component={ResetPasswordConfirm} />
                    <Route exact path='/activate/:uid/:token' component={Activate} />
            </Switch>               
            </Layout>
        </Router>
    </Provider>
);

export default App;
