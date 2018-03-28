import { connect } from 'react-redux';
import { selectAllPokemon } from '../../reducers/selectors';
import PokemonDetail from './pokemon_detail';
import { requestPoke } from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state)
});

const mapDispatchToProps = dispatch => ({
  requestPoke: (id) => dispatch(requestPoke(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
