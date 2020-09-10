import React, { useState} from 'react';
import { Layout, Menu, Breadcrumb } from 'antd';
import { Link,withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import {load_user,logout } from '../actions/auth';

import {
    DesktopOutlined,
    PieChartOutlined,
    FileOutlined,
    TeamOutlined,
    UserOutlined,
  } from '@ant-design/icons';

const { Header, Content, Footer,Sider } = Layout;

const { SubMenu } = Menu;

const CustomLayout = (props) => {

    const [collapsed, setCollapsed] = useState(true)
    const  onCollapse = collapsed => setCollapsed(collapsed);

    return (
        <Layout style={{ minHeight: '100vh' }}>
        <Sider collapsible collapsed={collapsed} onCollapse={onCollapse}>
          <div className="logo" />
          <Menu theme="dark" defaultSelectedKeys={['1']} mode="inline">
            <Menu.Item key="1" icon={<PieChartOutlined />}>
              Option 1
            </Menu.Item>
            <Menu.Item key="2" icon={<DesktopOutlined />}>
              Option 2
            </Menu.Item>
            <SubMenu key="sub1" icon={<UserOutlined />} title="User">
              <Menu.Item key="3">Tom</Menu.Item>
              <Menu.Item key="4">Bill</Menu.Item>
              <Menu.Item key="5">Alex</Menu.Item>
            </SubMenu>
            <SubMenu key="sub2" icon={<TeamOutlined />} title="Team">
              <Menu.Item key="6">Team 1</Menu.Item>
              <Menu.Item key="8">Team 2</Menu.Item>
            </SubMenu>
            <Menu.Item key="9" icon={<FileOutlined />} />
          </Menu>
        </Sider>
        <Layout className="site-layout">
          <Header>
            <div className="logo" />
            <Menu theme="dark" mode="horizontal" defaultSelectedKeys={['1']}>
                <Menu.Item key="1"><Link to="/">Inicio</Link></Menu.Item>
                <Menu.Item key="2"><Link to="/demo">Demo</Link></Menu.Item>
                <Menu.Item key="3"><Link to="/ticket">Comprados</Link></Menu.Item>
                <Menu.Item key="4"><Link to="/list">list</Link></Menu.Item>
                { 
                    props.isAuthenticated ? 

                    <Menu.Item key="5" onClick={props.logout}>Cerrar Sesión</Menu.Item> 
                    : 
                  
                      <Menu.Item key="5">
                      <Link to="/login">Iniciar Sesión</Link>
                      </Menu.Item>
            
                }
             </Menu>
          </Header>
          <Content style={{ margin: '0 16px' }}>
            <Breadcrumb style={{ margin: '16px 0' }}>
              <Breadcrumb.Item>User</Breadcrumb.Item>
              <Breadcrumb.Item>Bill</Breadcrumb.Item>
            </Breadcrumb>
            <div  style={{background:"#fff",padding:24,minHeight:280}}>
               {props.children}
            </div>
          </Content>
          <Footer style={{ textAlign: 'center' }}>Ant Design ©2018 Created by Ant UED</Footer>
        </Layout>
      </Layout>
    );
};
const mapStateToProps = state => ({
    isAuthenticated: state.auth.isAuthenticated
});

export default withRouter(connect(mapStateToProps, {logout})(CustomLayout));
