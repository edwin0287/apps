import React, { useState, useEffect } from 'react';
//librería para la obtención de datos
import axios from 'axios';
import { connect } from 'react-redux';

import Ticket  from '../components/Ticket'; 

const TicketList =(props) =>{
    //inicio de metodos de axios para la obtención de los datos
    const [ticket,setTicket]= useState([]);
    console.log('Ticket');
    //console.log(localStorage.getItem('access'));
    useEffect(() =>{
          const config = {
            headers: {
                'Content-Type': 'application/json',
                //'Authorization': `JWT ${localStorage.getItem('access')}`,
                'Accept': 'application/json'
            }
         };
          const fetchticket = async () => {
              try{
                 const res = await axios.get(`${process.env.REACT_APP_API_URL}/ticket/list/`, config);
                 setTicket(res.data);
              }
              catch(err){

              }
          }
          if (props.isAuthenticated){
            fetchticket();
          }
    },[]);
       return(<Ticket data={ticket}/>);
       
};
const mapStateToProps = state => ({
  isAuthenticated: state.auth.isAuthenticated
});

//export default ArticleList;
export default connect(mapStateToProps)(TicketList);