import React from 'react';
import { List} from 'antd';
import { Link,useHistory } from 'react-router-dom';
const Ticket = (props)=>{
    let history= useHistory();
    const Player =(id)=> {
         history.push(`/videoplayer/${id}`);
    }
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
                <List.Item
                    key={item.title}
                    extra={
                        <button onClick={() => Player(item.id)} type="button" className="btn btn-primary">
                                    VER EVENTO
                                    </button>
                    }                
                >
                     <List.Item.Meta
                        title={<Link to={`list/${item.id}`}>{item.title}</Link>}
                        description={item.description}
                    />
                    <p><strong>{item.date_event}</strong></p> 
               </List.Item>
            )}
        />
    )
}

export default Ticket;