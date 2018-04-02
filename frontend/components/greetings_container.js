import { connect } from 'react-redux';
import Greetings from './greetings';
import { logout, login, signup } from '../actions/session_actions';

const mapStateToProps = (state) => {
  return {currentUser: state.session.currentUser };
};

const mapDispatchToProps = (dispatch) => ({
  logout: () => dispatch(logout()),
  login: (user) => dispatch(login(user)),
  signup: (user) => dispatch(signup(user))
});

export default connect(mapStateToProps,
  mapDispatchToProps
)(Greetings);
