import React, { Component } from 'react';
import './GameSite.css'

import {
  Route,
  NavLink,
  HashRouter,
} from "react-router-dom";

import NewRecommendationForm from './NewRecommendationForm';

class GameSite extends Component {
  render() {
    return (
      <HashRouter>
      <div className='gamesite'>

      <div className='gamesite-header'>
      <ul className='header__text'>
      <li>
      <NavLink to="/">Home Page </NavLink>
      </li>
      <li>
      <NavLink to="/recommendations">Get A Recommendation </NavLink>
      </li>
      </ul>
      </div>

      <div className='content'>
      <Route path='/recommendations'
      render={ () => (
        <NewRecommendationForm />
      )}
      />
      </div>

      </div>
      </HashRouter>
    )
  }
}

export default GameSite;
