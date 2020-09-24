import React,{ useState, useEffect } from 'react';
import axios from 'axios';
import ReactPlayer from 'react-player';
import { Row, Col } from 'antd';

const  VideoDetail =(props) =>{

    const [event,setEvent]= useState({});
    useEffect(() => {     
        const eventID= props.match.params.id;
        console.log(eventID)
        const config = {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `JWT ${localStorage.getItem('access')}`,
                'Accept': 'application/json'
            }
        };

        const fetchEvent = async () =>{
            try{
                const res = await axios.get(`${process.env.REACT_APP_API_URL}/api/video/${eventID}`, config);
                setEvent(res.data);
            }
            catch (err){

            }
        }
        fetchEvent();       
    },[]);
    //'https://8343f7014c0ea438.mediapackage.us-west-2.amazonaws.com/out/v1/4cf229936cad426c9edca62e52fb8da9/index.m3u8' 
    return(
        <div align-items= "center">
             <Row justify="center">
                <Col span={24} offset={2}>
                        <h4>{event.title}</h4>
                        <ReactPlayer controls url={event.url} 
                         playing
                         width='90%'
                         height='500px'
                         onReady = {()=> console.log('onReady callback')}
                         onStart = {()=> console.log('onStart callback')}
                         onPause = {()=> console.log('onPause callback')}
                         onEnded = {()=> console.log('onEnded callback')}
                         onError = {()=> console.log('onError callback')}/>
                </Col>
             </Row>
        </div>

       );
   
};
export default (VideoDetail);