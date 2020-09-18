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
        <div className="site-card-wrapper">
            <Row gutter={16}>
                <Col span={8}>
                    <Card
                        hoverable
                        style={{ width: 240 }}
                        cover={<img alt="example" src="https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png" />}
                        bordered={false}
                    >
                        <Meta title="Europe Street beat" description="www.instagram.com" />
                    </Card>
                </Col>
                <Col span={8}>
                    <Card title={event.title} bordered={false}>
                        <div> Costo: USD. <strong>{event.costo}</strong></div>
                        <div>{event.description}</div>
                        <div>{event.content}</div>
                    </Card>
                </Col>
            </Row>
        </div>
          /*<Card >
              <Row gutter={16}>
                <Col className="gutter-row" span={6}>
                  <div>
                      <img
                            width={272}
                            alt="logo"
                            src="https://gw.alipayobjects.com/zos/rmsportal/mqaQswcyDLcXyDKnZfES.png"
                      />
                   </div>
                </Col>
                <Col className="gutter-row" span={6}>
                    <div><strong>{event.title}</strong></div>
                    <div>{event.title}</div>
                    <div>{event.description}</div>
                    <div>{event.content}</div>

                </Col>

              </Row>
            </Card>*/

       );
   
};


const mapStateToProps = state => ({
    isAuthenticated: state.auth.isAuthenticated
  });
  

export default connect(mapStateToProps)(EventDetail);