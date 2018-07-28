import { connect } from 'react-redux';
import  PokemonForm from './pokemon_form';
import { savePoke } from '../../actions/pokemon_actions';
import { Route, withRouter } from 'react-router-dom';

const mapDispatchToProps = dispatch => ({
  savePoke: (params) => dispatch(savePoke(params))
});

export default connect(
  mapDispatchToProps
)(PokemonForm);
