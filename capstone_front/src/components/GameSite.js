import React, { Component } from 'react';
import './GameSite.css'

import NewRecommendationForm from './NewRecommendationForm';

class GameSite extends Component {
  render() {
    return (
      <div className='gamesite'>

      <div className='gamesite-header'>
      </div>

      <div className="form-container">
      <NewRecommendationForm />
      </div>

      </div>
    )
  }
}

export default GameSite;
