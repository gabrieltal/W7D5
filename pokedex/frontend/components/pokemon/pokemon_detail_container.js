import { connect } from 'react-redux';
import { selectPoke } from '../../reducers/selectors';
import PokemonDetail from './pokemon_detail';
import { requestPoke } from '../../actions/pokemon_actions';
import { Route, withRouter } from 'react-router-dom';

const mapStateToProps = (state, ownProps) => {
  return {
    poke: state.entities.pokemon[ownProps.match.params.id]
  };
};

const mapDispatchToProps = dispatch => ({
  requestPoke: (id) => dispatch(requestPoke(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
