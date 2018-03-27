import { connect } from 'react-redux';
import { receiveTodos, receiveTodo } from '../../actions/todo_actions'; // action creator
import TodoList from './todo_list'; // presentational component to connect
import allTodos from '../../reducers/selectors';

const mapStateToProps = (state) => ({ // map slice of state to props object
	todos: allTodos(state)
});

const mapDispatchToProps = (dispatch) => ({ // create action dispatcher
	receiveTodo: (todo) => dispatch(receiveTodo(todo))
});

const ListContainer = connect(
	mapStateToProps,
	mapDispatchToProps
)(TodoList);

export default ListContainer;
