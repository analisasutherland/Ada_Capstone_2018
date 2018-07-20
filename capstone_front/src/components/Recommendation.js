import React, { Component } from 'react';
import PropTypes from 'prop-types';

import './Recommendation.css'


class Recommendation extends Component {
  static propTypes = {
    game_id: PropTypes.number.isRequired,
    game_title: PropTypes.string,
    image: PropTypes.string
  }

  // trimImg = (image) => {
  //   let trimmed_img = image.trim("");
  //   return trimmed_img
  // }

  render() {
    console.log(this.props);
    return(
      <div className='rec-container'>

        <section className='recommendation'>
          <div className='rec-header'>

            <div className='rec-content'>
              <h3> We Think You Might Enjoy...</h3>
              <p>Game:
                {this.props.game_id}
                {this.props.game_title}
                <p>{this.props.image}</p>
              </p>
            </div>

          </div>

          <div className='rec-content'>
          </div>
        </section>

      </div>
    )
  }
}

export default Recommendation;
// const Recommendation = ({recommendation}) =>
// <div className="single-rec" key={recommendation.id}>
// <h4>{recommendation.game}</h4>
