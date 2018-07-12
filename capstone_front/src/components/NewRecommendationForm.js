import React, { Component } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';

import './NewRecommendationForm.css';

class NewRecommendationForm extends Component {
  render(){
    return(
      <div className='whole-rec-form'>

      <legend>What Kind of Games Would You Like To Play?</legend>

      <form className="rec-form">

      <div>
      <input type="checkbox" name="search_value" value="Value_1" />
      <label>Value 1</label>
      </div>

      <div>
      <input type="checkbox" name="search_value" value="Value_2" />
      <label>Value 2</label>
      </div>

      <div>
      <input type="checkbox" name="search_value" value="Value_3" />
      <label>Value 3</label>
      </div>

      <div>
      <input type="checkbox" name="search_value" value="Value_4" />
      <label>Value 4</label>
      </div>

      <div>
      <input type="checkbox" name="search_value" value="Value_5" />
      <label>Value 5</label>
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
