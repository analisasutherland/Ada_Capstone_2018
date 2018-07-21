import React, { Component } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';
// import Recommendation from './Recommendation';

import './NewRecommendationForm.css';

const BASE_URL = 'http://localhost:3001'

class NewRecommendationForm extends Component {
  static propTypes = {
    getRecommendationscallback: PropTypes.func
  }

  constructor() {
    super();
    this.state = {
      selected_tags: [],
      recommendation_id: []
    };
  }

  onInputChange = (event) => {
    console.log('Topic Selected')
    this.setState({
      selected_tags:
      [...this.state.selected_tags, event.target.value]
    });
  }

  // Recommendation created upon form submit
  onFormSubmit = (event) => {
    event.preventDefault();
    console.log('form submit')
    console.log(this.state.selected_tags);

    let searchURL = BASE_URL + `/recommendations`

    let approvedTags = {
      selected_tags: this.state.selected_tags
    }

    axios.post(searchURL, approvedTags)
    .then((response) => {
      console.log('Success');

      console.log('*******', response.data);

      this.setState({recommendation_id: response.data});


      this.props.getRecommendationscallback(response.data)
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
      value="action"
      onChange={this.onInputChange}
      />
    <label>Action</label>
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

// <div className='rec-results'>
//   { recommendation_id }
// </div>
