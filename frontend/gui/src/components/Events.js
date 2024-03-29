import React,{ useState } from 'react';
import { List,Space, Col,Button,Card,Carousel,Image } from 'antd';
import { Link,useHistory } from 'react-router-dom';
import Modal from 'antd/lib/modal/Modal';
import store from '../store';
import axios from 'axios';

const IconText = ({ icon, text }) => (
    <Space>
      {React.createElement(icon)}
      {text}
    </Space>
  );

  const fetchTicket = async (idsr,idev) =>{

    const config = {
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `JWT ${localStorage.getItem('access')}`,
            'Accept': 'application/json'
        }
    };

    const body = JSON.stringify({ User_id: idsr, event_id:idev}); 

    try{
        const res = await axios.post(`${process.env.REACT_APP_API_URL}/api/ticket/`, body, config);
    
    } catch(err){

    }
}

const Events = (props)=>{

    const [visible, setVisible] = useState(false);
    
    const [eventid,setEventid] = useState(0);

    const [comprar, setComprar] = useState(false);

    const [userid, setUserid]   = useState(0);

    const state= store.getState();

    const validlog=props.authen;

    let history = useHistory();
  
    const showModal = (id) => {
        console.log(validlog)
        if (validlog){
            setEventid(id);
            setUserid(state.auth.user.id);
            setVisible(true);
        }
        else{
              history.push('/login');
        }
      }

    const okModal = e => {
        setComprar(true);
        fetchTicket(userid,eventid);
        setVisible(false);
      }
    
    
    const hideModal = e => {
        setVisible(false);
      }
    
    const contentStyle = {
        height: '100%',
        width: '100%',
        color: '#fff',
        lineHeight: '160px',
        textAlign: 'center',
        background: '#364d79',
    };
    const imgStyle = {
        width: '100%',
        height:'100%'
      };
    return(    
       <> 
            <Carousel autoplay>
                <div style={contentStyle} >
                    <Image style={imgStyle} alt="example1" src="http://localhost:8000/media/photos/2020/09/21/electronic.jpg" />
                </div>
                <div style={contentStyle}>
                    <Image style={imgStyle} alt="example2" src="http://localhost:8000/media/photos/2020/09/21/larkonline.jpg" />
                </div>
                <div style={contentStyle}>
                <Image style={imgStyle} alt="example3" src="http://localhost:8000/media/photos/2020/09/21/ChromaCat.jpg" />
                </div>
                <div style={contentStyle}>
                    <Image style={imgStyle} alt="example4" src="http://localhost:8000/media/photos/2020/09/21/corey.jpg"/>
                </div>
            </Carousel>
            <h2>CARTELERA</h2>
            <List
                grid={{
                    gutter: [32, 16],
                    xs: 2,
                    sm: 2,
                    md: 4,
                    lg: 4,
                    xl: 3,
                    xxl: 3,
                  }}
                pagination={{
                onChange:(page)=> {
                    console.log(page);
                },
                pageSize: 3,
                }}
                dataSource={props.data}
                renderItem={item => (
                    <List.Item>
                            <Card>
                              <p><h2>USD. {item.costo}</h2></p>
                              <p>{<Link to={`list/${item.id}`}>{item.title}</Link>}</p> 
                              <p>{item.description}</p>
                              <p><strong>{item.date_event}</strong></p> 
                              <p><button  onClick={() => showModal(item.id)} type="button" className="btn btn-primary">
                                    COMPRAR TICKET
                                    </button>
                                </p>
                            </Card>
                              
                    </List.Item>
                )}
            />
            <Modal
                title=""
                visible={visible}
                onOk={okModal}
                onCancel={hideModal}
                okText="Comprar"
                cancelText="Cancelar"
            > 
                <p><center> Para hacer válida su compra click en <strong>comprar</strong></center></p>
            </Modal>
        </>
    );
};

export default Events;