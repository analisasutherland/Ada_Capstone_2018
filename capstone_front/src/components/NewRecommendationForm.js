import React, { Component } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';

import './NewRecommendationForm.css';

const BASE_URL = 'http://localhost:3001/'
// TODO: Build event handler for on Submit and onInputChange
class NewRecommendationForm extends Component {
  constructor() {
    super();
    this.state = {
      selected_topics: []
    };
  }

  onInputChange = (event) => {
    console.log('input was changed')
    console.log(event.target);
  }
  // Using hardcoded data right now for a recommendation creation
  onFormSubmit = (event) => {
    event.preventDefault();
    console.log('clicked submit')

    let searchURL = BASE_URL + `/recommendations`

    axios.post(searchURL, {
      game_id: 1,
      score: 0,
      user_id: 1
    })

    .then((response) => {
      console.log('Success');
      console.log(response.data);
      // this.setState({results: response.data});
      // console.log(this.state.results);
    })

    .catch((error) => {
      // TODO: include Status Message using Status Component
      console.log(error);
    });
  }

  render(){
    return(
      <div className='whole-rec-form'>

      <legend>What Kind of Games Would You Like To Play?</legend>

      <form className="rec-form" onSubmit={this.onFormSubmit}>

      <div>
      <input
      type="checkbox"
      name="search_value"
      value="RPG"
      onChange={this.onInputChange}
      />
      <label>RPG</label>
      </div>

      <div>
      <input
      type="checkbox"
      name="search_value"
      value="adventure"
      onChange={this.onInputChange}
      />
      <label>Adventure</label>
      </div>

      <div>
      <input
      type="checkbox"
      name="search_value"
      value="puzzle"
      onChange={this.onInputChange}
      />
      <label>Puzzle</label>
      </div>

      <div>
      <input type="checkbox"
      name="search_value"
      value="portable"
      onChange={this.onInputChange}
      />
      <label>Portable</label>
      </div>

      <div>
      <input
      type="checkbox"
      name="search_value"
      value="mystery"
      onChange={this.onInputChange}
      />
      <label>Mystery</label>
      </div>

      <div className="submit-button">
      <button type='submit'>Find Games</button>
      </div>

      </form>
      </div>
    )
  }
}

export default NewRecommendationForm;
