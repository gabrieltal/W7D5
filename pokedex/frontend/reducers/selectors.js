import _ from 'lodash';

export const selectAllPokemon = (state) => {
  const pokemon = state.entities.pokemon;
  return _.values(pokemon);
};
