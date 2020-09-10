import React from 'react';
import { List,Col } from 'antd';

const Ticket = (props)=>{
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
            //footer={<div><b>ant design</b> footer part</div>}
            renderItem={item => (
                <List.Item>
                        <Col className="gutter-row" span={8}>          
                                <p>Id del usuario {item.User_id}</p>
                        </Col>
                        <Col className="gutter-row" span={8}>         
                                <p>Id del Evento  {item.event_id}</p>

                        </Col>  
               </List.Item>
            )}
        />
    )
}

export default Ticket;