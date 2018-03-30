import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from 'react-router-dom';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
    this.state = {name: '', image_url: ''};
    // this.componentDidMount = this.componentDidMount.bind(this);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render () {
    const pokemonItems = this.props.pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} />);
    return (
      <div>
        <Route path="/pokemon/:id" component={PokemonDetailContainer}/>
        <ul>
          {pokemonItems}
        </ul>
      </div>
    );
  }
}

export default PokemonIndex;
