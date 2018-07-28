import { connect } from 'react-redux';
import { selectPokemonItems } from '../../reducers/selectors';
import ItemDetail from './item_detail';
import { Route, withRouter } from 'react-router-dom';
import { requestItem } from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => {

  return {
    items: selectPokemonItems(state, ownProps.match.params.itemId)
  };
};

const mapDispatchToProps = dispatch => ({
  requestItem: (id) => dispatch(requestItem(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ItemDetail);
