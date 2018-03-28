import React from 'react';

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
    const pokemonArray = [];
    this.props.pokemon.forEach((poke) => {
      pokemonArray.push(<li key={poke.id}>{poke.name}<img src={poke.image_url}/></li>);
    });

    return (
      <ul>
        {pokemonArray}
      </ul>
    );
  }
}

export default PokemonIndex;
