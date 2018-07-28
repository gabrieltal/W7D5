import { RECEIVE_ALL_POKEMON, RECEIVE_POKE, CREATE_POKE } from '../actions/pokemon_actions';

export default function pokemonReducer (state={}, action) {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_POKE:
      return Object.assign({}, state, {[action.poke.pokemon.id]: action.poke.pokemon});
    case CREATE_POKE:
      const newState = [...state];
      newState.push(action.poke);
      return newState;
    default:
      return state;
  }
}
