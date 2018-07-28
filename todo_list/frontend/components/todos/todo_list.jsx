import React from 'react';
import ListContainer from './todo_list_container';
import store from '../../store/store';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }


  render () {
    const keys = Object.keys(this.props.todos);

    const items = keys.map( (id) => (
      <TodoListItem key= {id.toString()}
                    item = {this.props.todos[id]}/>
    ));

    return (
      <div>
        <ul>
          { items }
        </ul>

        <TodoForm receiveTodo={this.props.receiveTodo}/>
      </div>
    );
  }
}

export default TodoList;
