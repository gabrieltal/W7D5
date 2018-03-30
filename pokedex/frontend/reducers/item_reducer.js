import { RECEIVE_ALL_POKEMON, RECEIVE_POKE } from '../actions/pokemon_actions';

export default function itemReducer (state={}, action) {
  Object.freeze(state);
  switch (action.type) {
    // case RECEIVE_ALL_POKEMON:
    //   return action.items;
    case RECEIVE_POKE:
      return action.poke.items;
    default:
      return state;
  }
}
