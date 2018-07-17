import React, { Component } from 'react';
import './GameSite.css';
import axios from 'axios';
import {
  Route,
  NavLink,
  HashRouter,
} from "react-router-dom";

import NewRecommendationForm from './NewRecommendationForm';
import Recommendation from './Recommendation';


class GameSite extends Component {
  constructor() {
    super();
    this.state = {
      recommendations: ''
    };
  }

  getRecommendations = () => {
    let rec_URL = 'http://localhost:3001/recommendations';

    axios.get(rec_URL)
    .then((response) => {
      console.log('Success');
      console.log(response.data);
      const recommendations_lists = response.data
      this.setState({ recommendations: recommendations_lists });
    })
    .catch((error) => {
      console.log(error);
    });
  }

  renderRecsOrForm = (recommendations) => {
    if (recommendations.length == 0) {
      return (
        <Route
        path='/recommendations'
        render= { () => (
          <NewRecommendationForm
          getRecommendationscallback={this.getRecommendations} /> )}
          />);
        }
        return ( <Recommendation /> );
      }

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
          { this.renderRecsOrForm(this.state.recommendations)}
          </div>

          </div>
          </HashRouter>
        )
      }
    }
export default GameSite;
// TODO: GameSite state determines what is rendered by GameSite

// if recommendations exsist in state then render Recc Component
// else
// render NewRecommendationForm
