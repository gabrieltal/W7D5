import React from 'react';

export const fetchAllPokemon = () => {
  return $.ajax({
    url: "/api/pokemon",
    method: "GET",
    dataType: "json"
  });
};
