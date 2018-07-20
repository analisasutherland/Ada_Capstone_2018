import React, { Component } from 'react';
// import logo from './logo.svg';
import './App.css';
import GameSite from './components/GameSite';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <h1 className="App-title">JUST YOU WAIT</h1>
        </header>
        <GameSite />
      </div>
    );
  }
}

export default App;
// <img src={logo} className="App-logo" alt="logo" />
