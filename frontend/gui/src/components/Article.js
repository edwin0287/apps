import React,{ useState } from 'react';
import { List,Space, Col,Button} from 'antd';
import { Redirect } from 'react-router-dom';
import Modal from 'antd/lib/modal/Modal';
import store from '../store';

const IconText = ({ icon, text }) => (
    <Space>
      {React.createElement(icon)}
      {text}
    </Space>
  );
const Articles = (props)=>{

    const [visible, setVisible] = useState(false);
    
    const [eventid,setEventid] = useState(0);

    const [comprar, setComprar] = useState(false);

    const showModal = (id) => {
        setEventid(id);
        console.log(eventid);
       
        const state = store.getState();
        console.log(state.auth.user);

        setVisible(true);
      }

    const okModal = e => {
        setComprar(true);
      }
    
    
    const hideModal = e => {
        setVisible(false);
      }

    if (comprar)
        return <Redirect to='/' />;
      
    return(    
       <> 
            <List
                itemLayout="horizontal"
                size="large"
                pagination={{
                onChange:(page)=> {
                    console.log(page);
                },
                pageSize: 2,
                }}
                dataSource={props.data}
                //footer={<div><b>ant design</b> footer part</div>}
                renderItem={item => (
                    <List.Item>  
                        <Col className="gutter-row" span={8}>         
                                <img
                                    width={272}
                                    alt="logo"
                                    src="https://gw.alipayobjects.com/zos/rmsportal/mqaQswcyDLcXyDKnZfES.png"
                                /> 
                        </Col>
                        <Col className="gutter-row" span={8}>          
                                <p>{<a href={`list/${item.id}`}>{item.title}</a>}</p>
                                <p>{item.content}</p>
                                <p><strong>{item.date_event}</strong></p> 
                        </Col>
                        <Col className="gutter-row" span={8}>         
                                <p><h2>USD. 10.00</h2></p>
                                <p><button  onClick={() => showModal(item.id)} type="button" className="btn btn-primary">
                                    COMPRAR TICKET
                                    </button>
                                </p> 
                            </Col>                              
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
                <p><center>{eventid} Para hacer válida su compra click en <strong>comprar</strong></center></p>
            </Modal>
        </>
    );
};

/*const mapStateToProps = state => ({
    isAuthenticated: state.auth.isAuthenticated
});
export default connect(mapStateToProps)(Articles);*/
export default Articles;