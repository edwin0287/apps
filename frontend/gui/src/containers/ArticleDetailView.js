import React,{ useState, useEffect } from 'react';
import axios from 'axios';
import { Card } from 'antd';
import { connect } from 'react-redux';

const  ArticleDetail =(props) =>{

    const [event,setEvent]= useState({});
   
    console.log(props);
    
    useEffect(() => {     
        const eventID= props.match.params.id;
        const config = {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `JWT ${localStorage.getItem('access')}`,
                'Accept': 'application/json'
            }
        };

        const fetchEvent = async () =>{
            try{
                const res = await axios.get(`${process.env.REACT_APP_API_URL}/api/${eventID}`, config);
                setEvent(res.data);
            }
            catch (err){

            }
        }
        fetchEvent();       
    },[]);

    return(
          <Card title={event.title}>
                <p>{event.content}</p>
            </Card>

       );
   
};


const mapStateToProps = state => ({
    isAuthenticated: state.auth.isAuthenticated
  });
  

export default connect(mapStateToProps)(ArticleDetail);