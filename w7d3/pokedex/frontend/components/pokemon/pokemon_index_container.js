import { connect } from 'react-redux';
import { selectAllPokemon } from '../../reducers/selectors';
import PokemonIndex from './pokemon_index';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import { withRouter } from 'react-router-dom';

const mapStateToProps = (state, ownProps) => {
  return { pokemon: selectAllPokemon(state) };
};

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(requestAllPokemon())
});

export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex));
