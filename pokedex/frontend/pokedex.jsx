import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import fetchAllPokemon from './util/api_util';
import configureStore from './store/store';
import { selectAllPokemon } from './reducers/selectors';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.requestAllPokemon = requestAllPokemon;

  // ReactDOM.render(<h1>Pokedex</h1>, rootEl);

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});
