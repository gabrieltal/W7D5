import React from 'react';
import ReactDOM from 'react-dom';
import { signup, logout, login} from './util/session_api_util';
import configureStore from './store/store';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');

  const store = configureStore();

  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.signup = signup;
  window.logout = logout;
  window.login = login;
});
