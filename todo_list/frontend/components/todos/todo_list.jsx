import React from 'react';
import { allTodos } from '../../reducers/selectors';
import store from '../../store/store';

// class TodoList extends React.Component {
//   render () {
//     const todosArray = allTodos(store().getState());
//     return (
//       <h3> Todo list goes here!!!</h3>
//     );
//   }
// }

// export default TodoList;

module.exports = () => <h3>Todo List goes here!</h3>;
