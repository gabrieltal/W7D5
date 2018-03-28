import React from 'react';

class PokemonDetail extends React.Component {
    constructor (props) {
      super(props);
    }

    componentDidMount() {
      this.props.requestPoke(this.props.match.params.pokemonId);
    }

    render () {
      return (
        <ul>
          <li><img src={this.props.pokemon.image_url}/></li>
          <li><h1>{this.props.name}</h1></li>
          <li>Type: {this.props.type}</li>
          <li>Attack: {this.props.attack}</li>
          <li>Defense: {this.props.defense}</li>
          <li>Moves: {this.props.moves}</li>
        </ul>
      );
    }
}
