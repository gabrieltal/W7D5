import { RECEIVE_CURRENT_USER, SIGN_OUT } from '../actions/session_actions';

const _nullSession = {
  currentUser: null
};

export default (state=_nullSession, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, action.person );
    case SIGN_OUT:
      return _nullSession;
    default:
      return state;
  }
};
