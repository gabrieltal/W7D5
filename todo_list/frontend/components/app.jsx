import React from 'react';
import ListContainer from './todos/todo_list_container';

class App extends React.Component {
  render () {
    return (
      <div>
        <h1 className="app-Comp"> A very cool Todo List App </h1>
        <ul>
          <ListContainer />
        </ul>
      </div>
    );
  }

}

export default App;
