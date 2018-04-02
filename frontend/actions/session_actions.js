import * as APIUtil from '../util/session_api_util';
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const SIGN_OUT = 'SIGN_OUT';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

export const login = user => (dispatch) => {
  APIUtil.login(user)
    .then(person => dispatch(receiveCurrentUser(person)));
};

export const signup = (user) => (dispatch) => {
  APIUtil.signup(user)
    .then(person => dispatch(receiveCurrentUser(person)));
};

export const logout = () => (dispatch) => {
  APIUtil.logout()
    .then(() => dispatch(signOut()));
};

export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const signOut = () => ({
  type: SIGN_OUT
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});
