import React from 'react';
import { BrowserRouter as Router,Route, Switch} from 'react-router-dom';
import Login from './containers/Login';
import Signup from './containers/Signup';
import Activate from './containers/Activate';
import ResetPassword from './containers/ResetPassword';
import ResetPasswordConfirm from './containers/ResetPasswordConfirm';

import List from './containers/EventListView';

import video from './containers/VideoDetailView'

import ListDetail from './containers/EventDetailView';

import TicketList from './containers/TicketListView';

import { Provider } from 'react-redux';
import store from './store';

import Layout from './hocs/Layout';

import 'antd/dist/antd.css';

const App = () => (
    <Provider store={store}>
        <Router>
            <Layout>
            <Switch>
                    <Route exact path='/' component={List}/>
                    <Route exact path='/list/:id/' component={ListDetail}/>
                    <Route exact path='/ticket' component={TicketList} />
                    <Route exact path='/videoplayer/:id' component={video} />
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
