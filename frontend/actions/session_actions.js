import * as APIUtil from '../util/session_api_util';
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const SIGN_OUT = 'SIGN_OUT';

export const login = user => (dispatch) => {
  APIUtil.login(user)
    .then(person => dispatch(signIn(person)));
};

export const signup = (user) => (dispatch) => {
  APIUtil.signup(user)
    .then(person => dispatch(signUp(person)));
};

export const logout = () => (dispatch) => {
  APIUtil.logout()
    .then(() => dispatch(signOut()));
};

export const signIn = user => ({
  type: RECEIVE_CURRENT_USER,
  user
});

export const signOut = () => ({
  type: SIGN_OUT
});

export const signUp = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user
});
