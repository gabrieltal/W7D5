import _ from 'lodash';

export const selectAllPokemon = (state) => {
  const pokemon = state.entities.pokemon;
  return _.values(pokemon);
};

export const selectPokemonItems = (state) => {
  const items = state.entities.item;
  return _.values(items);
};

export const selectPoke = (state) => {

  const poke = state.entities.pokemon;
  return _.values(poke);
};
