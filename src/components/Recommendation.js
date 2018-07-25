import React, { Component } from 'react';
import PropTypes from 'prop-types';

import './Recommendation.css'


class Recommendation extends Component {
  static propTypes = {
    game_id: PropTypes.number.isRequired,
    game_title: PropTypes.string,
    image: PropTypes.string,
    url: PropTypes.string
  }

  render() {
    console.log(this.props);
    return(
      <div className="recommendation-container">
        <img src={this.props.image}/>
        <div className='legend'>
          <p className= 'primary-text'>{this.props.game_title}</p>
          <a className='secondary-text' href={this.props.url}>Read Review</a>
        </div>
      </div>
    )
  }
}

export default Recommendation;
// const Recommendation = ({recommendation}) =>
// <div className="single-rec" key={recommendation.id}>
// <h4>{recommendation.game}</h4>
