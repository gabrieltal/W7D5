import React from 'react';
import { Route } from 'react-router-dom';
import ItemDetailContainer from './item_detail_container';

class PokemonDetail extends React.Component {
    constructor (props) {
      super(props);
    }

    componentDidMount() {
      this.props.requestPoke(this.props.match.params.id);
    }

    componentWillReceiveProps(newProps) {

      if (this.props.match.params.id !== newProps.match.params.id) {
        this.props.requestPoke(newProps.match.params.id);
      }
    }

    render () {
      return (
        <section>
          <ul>
            <li><img src={this.props.poke.image_url}/></li>
            <li><h1>{this.props.poke.name}</h1></li>
            <li>Type: {this.props.poke.poke_type}</li>
            <li>Attack: {this.props.poke.attack}</li>
            <li>Defense: {this.props.poke.defense}</li>
            <li>Moves: {this.props.poke.moves}</li>
          </ul>

          <Route path="/pokemon/:pokemonId/items/:itemId" component={ItemDetailContainer}/>
        </section>
      );
    }
}

export default PokemonDetail;
