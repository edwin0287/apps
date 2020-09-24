import React,{ useState, useEffect } from 'react';
import axios from 'axios';
import { Card,Row, Col } from 'antd';
import { connect } from 'react-redux';

const  EventDetail =(props) =>{

    const [event,setEvent]= useState({});

    const { Meta } = Card;
    
    useEffect(() => {     
        const eventID= props.match.params.id;
        const config = {
            headers: {
                'Content-Type': 'application/json',
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
    const gridStyle = {
        width: '100%'
      };
    return(
        <div className="site-card-wrapper">
            <Row gutter={[40, 16]}>
                <Col span={12}>
                    <Card
                        hoverable
                        style={gridStyle}
                        cover={<img alt="example" src={event.thumbnail} />}
                        bordered={false}
                    >
                        <Meta title="Europe Street beat" description="www.instagram.com" />
                    </Card>
                </Col>
                <Col span={12}>
                    <Card hoverable bordered={false}>
                        <div> <strong><h2>{event.title}</h2></strong>  <strong><h2> USD.{event.costo}</h2></strong> </div> 
                        <div> <strong>Categoría: </strong>{event.category}</div>
                        <div>{event.description}</div>
                        <div>{event.content}</div>
                    </Card>
                </Col>
            </Row>
        </div>

       );
   
};


const mapStateToProps = state => ({
    isAuthenticated: state.auth.isAuthenticated
  });
  

export default connect(mapStateToProps)(EventDetail);