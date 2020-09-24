import React from 'react';
import { List,Avatar,Card,Row, Col } from 'antd';
import { Link,useHistory } from 'react-router-dom';
const Ticket = (props)=>{
    let history= useHistory();
    const Player =(id)=> {
         history.push(`/videoplayer/${id}`);
    }
    const gridStyle = {
        width: '100%',
        height:'100%'
      };

    const { Meta } = Card;
    return(    
        <List
            itemLayout="vertical"
            size="large"
            pagination={{
            onChange:(page)=> {
                console.log(page);
            },
            pageSize: 3,
            }}
            dataSource={props.data}
            renderItem={item => (
               <List.Item>
                    <div align-items= "center">
                       <Row gutter={[2, 16]} justify="center" align="top" >
                         <Col xs={{ span: 4, offset: 1 }} lg={{ span: 5, offset: 1 }} >
                            <Card
                             hoverable
                             style={gridStyle}
                             cover={<img alt="example" src={`${process.env.REACT_APP_API_URL}/media/${item.thumbnail}`} />}
                            >
                                <Meta description="www.instagram.com" />
                            </Card>
                         </Col>
                         <Col xs={{ span: 8, offset: 1 }} lg={{ span: 10, offset: 1 }}> 
                                <Card bordered={false}>
                                    <div> <strong><h3>{<Link to={`list/${item.id}`}>{item.title}</Link>}</h3></strong></div>
                                    <p><strong>Cantidad: </strong>{item.count} comprado</p> 
                                    <p><strong>Fecha del Evento:</strong>{item.date_event}</p> 
                                    <p><strong>Fecha de Compra:</strong>{item.date_created}</p> 
                                    <p><strong>Descripción:</strong>{item.description}</p>
                                </Card>
                         </Col>
                         <Col xs={{ span: 4, offset: 1 }} lg={{ span: 5, offset: 1 }}>
                              <Card bordered={false}>
                                    <button onClick={() => Player(item.id)} type="button" className="btn btn-primary">
                                     VER EVENTO
                                    </button>
                              </Card>
                         </Col>
                      </Row>
                    </div>
               </List.Item>
            )}
        />
    )
}

export default Ticket;