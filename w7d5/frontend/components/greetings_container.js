import { connect } from 'react-redux';
import Greetings from './greetings';
import { logout, login, signup } from '../actions/session_actions';

const mapStateToProps = (state) => {
  const currentUser = state.session.currentUser || '';
  return { currentUser };
};

const mapDispatchToProps = (dispatch) => ({
  logout: () => dispatch(logout()),

});

export default connect(mapStateToProps,
  mapDispatchToProps
)(Greetings);
