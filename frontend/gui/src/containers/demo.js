import React from 'react';
import {Redirect } from 'react-router-dom';
import { connect } from 'react-redux';
//import ReactHLS from 'react-hls'; <ReactHLS source={"https://www.smashcast.tv/embed/viva-polska"} />'https://www.twitch.tv/tfue' 'https://www.twitch.tv/larkonline' 'https://8343f7014c0ea438.mediapackage.us-west-2.amazonaws.com/out/v1/4cf229936cad426c9edca62e52fb8da9/index.m3u8' 
import ReactPlayer from 'react-player' 

const demo = ({isAuthenticated}) => {
    if (isAuthenticated){
            return(
                <div className='container'>
                    <div className="jumbotron mt-5">
                        <h1 className="display-4">Bienvenido a DEMO!</h1>
                        <ReactPlayer controls url='https://www.twitch.tv/larkonline' 
                        onReady = {()=> console.log('onReady callback')}
                        onStart = {()=> console.log('onStart callback')}
                        onPause = {()=> console.log('onPause callback')}
                        onEnded = {()=> console.log('onEnded callback')}
                        onError = {()=> console.log('onError callback')}/>
                    </div>
                </div>
            );
        }
    else {
        return <Redirect to='/' />;
    }

};

const mapStateToProps = state => ({
    isAuthenticated: state.auth.isAuthenticated
});

export default connect(mapStateToProps)(demo);
