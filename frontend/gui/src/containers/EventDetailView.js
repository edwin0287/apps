import React,{ useState, useEffect } from 'react';
import axios from 'axios';
import { Card,Row, Col } from 'antd';
import { connect } from 'react-redux';

const  EventDetail =(props) =>{

    const [event,setEvent]= useState({});
   
    console.log(props);
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
                console.log(event)
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
                    <Card title={event.title} bordered={false}>
                        <div> <strong>Costo:</strong> USD.{event.costo}</div>
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