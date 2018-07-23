import React, { Component } from 'react';
import PropTypes from 'prop-types';

import './Recommendation.css'


class Recommendation extends Component {
  static propTypes = {
    game_id: PropTypes.number.isRequired,
    game_title: PropTypes.string,
    image: PropTypes.string
  }

  render() {
    console.log(this.props);
    return(
      <div>
        <img src={this.props.image} height="250" width="200"/>
        <div className='legend'>
          {this.props.game_id}
          {this.props.game_title}
        </div>
      </div>
    )
  }
}

export default Recommendation;
// const Recommendation = ({recommendation}) =>
// <div className="single-rec" key={recommendation.id}>
// <h4>{recommendation.game}</h4>
