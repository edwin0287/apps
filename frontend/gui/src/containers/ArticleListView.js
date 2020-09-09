import React, { useState, useEffect } from 'react';
import Articles  from '../components/Article'; 
//librería para la obtención de datos
import axios from 'axios';
import { connect } from 'react-redux';

const listData = [];
for (let i = 0; i < 23; i++) {
  listData.push({
    href: 'https://ant.design',
    title: `ant design part ${i}`,
    avatar: 'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png',
    description:
      'Ant Design, a design language for background applications, is refined by Ant UED Team.',
    content:
      'We supply a series of design principles, practical patterns and high quality design resources (Sketch and Axure), to help people create their product prototypes beautifully and efficiently.',
  });
}
/*const apiUrl='http://127.0.0.1:8000';
const authAxios= axios.create({
  baseURL:apiUrl


});*/

const ArticleList =(props) =>{
    //inicio de metodos de axios para la obtención de los datos
    const [event,setEvent]= useState([]);
    console.log(props.isAuthenticated);
    //console.log(localStorage.getItem('access'));
    useEffect(() =>{
          const config = {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `JWT ${localStorage.getItem('access')}`,
                'Accept': 'application/json'
            }
         };
          const fetchEvent = async () => {
              try{
                 const res = await axios.get(`${process.env.REACT_APP_API_URL}/api/event/`, config);
                 setEvent(res.data);
              }
              catch(err){

              }
          }
          if (props.isAuthenticated){
            fetchEvent();
          }
    },[]);
        return(<Articles data={event}/>);
       
};
const mapStateToProps = state => ({
  isAuthenticated: state.auth.isAuthenticated
});

//export default ArticleList;
export default connect(mapStateToProps)(ArticleList);