import React from 'react';
import GreetingsContainer from './greetings_container';
import {Provider } from 'react-redux';
const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingsContainer />
    </header>

  </div>
);

export default App;
