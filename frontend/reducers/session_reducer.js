import { RECEIVE_CURRENT_USER} from '../actions/session_actions';

const _nullSession = Object.freeze({
  currentUser: null
});

const sessionReducer = (state=_nullSession, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      const currentUser = action.currentUser;
      return Object.assign({}, { currentUser } );
    default:
      return state;
  }
};

export default sessionReducer;
