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
      console.log('*******', response.data);
      const recommendations_lists = response.data
      this.setState({ recommendations: recommendations_lists });
    })
    .catch((error) => {
      console.log(error);
    });
  }

  renderRecsOrForm = (recommendations) => {
    if (recommendations.length === 0) {
      return (
        <NewRecommendationForm
          getRecommendationscallback={this.getRecommendations} />
      )
    } else {
      let uniqueRecs = recommendations.forEach(function(obj) {
        if (recommendations.indexOf(obj.recommendation) === -1) recommendations.push(obj.recommendation)
      });

      return uniqueRecs.map((rec,index) => {
        // if (index < 3) {
        return <Recommendation
          key={index}
          index={index}
          game_id={rec.game_id}
          game_title={rec.game.game_title}
          />
        // }
      })
    }
  }

  onClick = () => {
    console.log('We have clicked!');
    this.setState(
      {
        recommendations: ''
      }
    );
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
                <NavLink to="/recommendations" onClick={this.onClick}>Get A Recommendation </NavLink>
              </li>
            </ul>
          </div>

          <div className='content'>
            <Route
              path='/recommendations'
              render= { () => (
                this.renderRecsOrForm(this.state.recommendations)
              )}
              />
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
