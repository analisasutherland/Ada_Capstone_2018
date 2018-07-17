import React, { Component } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';

import './NewRecommendationForm.css';

const BASE_URL = 'http://localhost:3001'

class NewRecommendationForm extends Component {
  constructor() {
    super();
    this.state = {
      selected_tags: [],
      recommendation_id: ''
    };
  }

  onInputChange = (event) => {
    console.log('input was changed')
    console.log(event.target.value);
    this.setState({
      selected_tags:
      [...this.state.selected_tags, event.target.value]
    });
  }
  // Using hardcoded data right now for a recommendation creation
  onFormSubmit = (event) => {
    event.preventDefault();
    console.log('clicked submit')
    console.log(this.state.selected_tags);

    let searchURL = BASE_URL + `/recommendations`

    // NOTE: This is hardcoded data to get a temp review, replace with retrieved data
    let approvedTags = {
      selected_tags: this.state.selected_tags
    }

    console.log(approvedTags);

    axios.post(searchURL, approvedTags)
    .then((response) => {
      console.log('Success');
      console.log(response.data);
      // this.setState({results: response.data});
      this.setState({recommendation_id: response.data.id})
      console.log(this.state.recommendation_id);
    })

    .catch((error) => {
      // TODO: include Status Message using Status Component
      console.log(error);
    });

    // QUESTION: Do I need to reset the rec id after I have created a new recommendation

    // this.setState({
    //   recommendation_id: ''
    // })
  }

  render(){
    // QUESTION: Do I need to only render out the game id or use the game id to pull the full game?

    // const reccs = this.state.results.map((results,index) => {
    //   return <Recommendation
    //   key={index}
    //   index={index}
    //   game={result.game_id}
    //   />
    // });
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
