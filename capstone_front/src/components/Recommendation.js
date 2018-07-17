import React, { Component } from 'react';
import './Recommendation.css'


class Recommendation extends Component {
  render() {
    return(
      <div className='rec-container'>

      <div className='rec-header'>
      <p>
      This is a new recommendation
      </p>
      </div>

      <div className='rec-content'>
      </div>

      </div>
    )
  }
}

export default Recommendation;
// const Recommendation = ({recommendation}) =>
// <div className="single-rec" key={recommendation.id}>
// <h4>{recommendation.game}</h4>
