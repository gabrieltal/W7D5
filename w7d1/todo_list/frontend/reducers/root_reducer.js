import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';

const rootReducer = combineReducers({todos: todosReducer});

//
// const rootReducer = (state = {}, action) => {
//   switch (action.type) {
//     // case expression:
//     //
//     //   break;
//     default:
//       return state;
//   }
// };

export default rootReducer;
