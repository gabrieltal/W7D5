import React from 'react';

class PokemonForm extends React.Component {
  constructor (props) {
    super(props);
    this.state = {
      name: "",
      poke_type: "",
      attack: "",
      defense: "",
      moves: []
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.savePoke(this.state);
  }

  handleChange(e) {
    this.setState({[e.target.name]: e.target.value});
  }

  render () {
    return (
      <form>
        <h3>Create new pokemon!!!</h3>
        <label>name
          <input onClick = {this.handleChange.bind(this)} type="text" name="name"/>
        </label>

        <label>Image url
          <input type="text" onClick = {this.handleChange.bind(this)} name = "image_url"/>
        </label>

        <label>poke_type
          <input onClick = {this.handleChange.bind(this)} type="text" name="poke_type"/>
        </label>

        <label>attack
          <input onClick = {this.handleChange.bind(this)} type="text" name="attack"/>
        </label>

        <label>defense
          <input onClick = {this.handleChange.bind(this)} type="text" name="defense"/>
        </label>

        <label>move
          <input onClick = {this.handleChange.bind(this)} type="text" name="move"/>
        </label>

        <button onSubmit={this.handleSubmit}>Create Pokemon!!</button>
      </form>
    );
  }
}

export default PokemonForm;
