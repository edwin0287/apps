import React,{ useState } from 'react';
import { List,Space, Col,Button,Card} from 'antd';
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
        console.log(res);
    
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
      }
    
    
    const hideModal = e => {
        setVisible(false);
      }

    return(    
       <> 
            <h2>CARTELERA</h2>
            <List
                //itemLayout="horizontal"
                //size="large"
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
                //footer={<div><b>ant design</b> footer part</div>}
                renderItem={item => (
                    <List.Item>
                            <Card>
                              <p><h2>USD. {item.costo}</h2></p>
                              <p>{<Link to={`list/${item.id}`}>{item.title}</Link>}</p> 
                              <p>{item.content}</p>
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

/*const mapStateToProps = state => ({
    isAuthenticated: state.auth.isAuthenticated
});
export default connect(mapStateToProps)(Articles);*/
export default Events;