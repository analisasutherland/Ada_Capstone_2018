import React, { Component } from 'react';
import './GameSite.css';
// import axios from 'axios';
import {
  Route,
  NavLink,
  HashRouter,
} from "react-router-dom";
import { Carousel } from 'react-responsive-carousel';
import "react-responsive-carousel/lib/styles/carousel.min.css";

import NewRecommendationForm from './NewRecommendationForm';
import Recommendation from './Recommendation';

class GameSite extends Component {
  constructor() {
    super();
    this.state = {
      recommendations: ''
    };
  }

  getRecommendations = (collection) => {
    this.setState({ recommendations: collection });
  }

  removeDuplicates = (recommendations) => {
    let uniqueRecs = [];
    let seenIds = [];
    recommendations.forEach(function(recommendation) {
      if (!seenIds.includes(recommendation.game_id)) {
        uniqueRecs.push(recommendation)
        seenIds.push(recommendation.game_id)
      }
    });
    return uniqueRecs;
  }


  onClick = () => {
    this.setState(
      {
        recommendations: ''
      }
    );
  }


  renderRecsOrForm = (recommendations) => {
    if (recommendations.length === 0) {
      return (
        <NewRecommendationForm
          getRecommendationscallback={this.getRecommendations} />
      )
    }
    let uniqueRecs = this.removeDuplicates(recommendations);
    console.log(recommendations);
    console.log(recommendations[0].game.image);
    return (
      <div className='carousel-overlay'>
        <div className='carousel-lightbox' onClick={this.onClick}></div>
        <Carousel showThumbs={false}>
          { uniqueRecs.slice(0, 3).map((recommendation,index) => {
            return <Recommendation
              key={index}
              index={index}
              game_id={recommendation.game_id}
              game_title={recommendation.game.game_title}
              image={recommendation.game.image}
              />
          })}
        </Carousel>
      </div>
    )
  }

  render() {
    return (
      <HashRouter>
        <div className='gamesite'>
          <div className='gamesite-header'>
            <ul className='header__text'>
              <li>
                <NavLink to="/" onClick={this.onClick}>Home Page </NavLink>
              </li>
              <li>
                <NavLink to="/recommendations" onClick={this.onClick}>Get A Recommendation </NavLink>
              </li>
            </ul>
          </div>
          <div className='scene'>
            <div className='content'>
              <Route
                path='/recommendations'
                render= { () => (
                  this.renderRecsOrForm(this.state.recommendations)
                )}
                />
            </div>
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
