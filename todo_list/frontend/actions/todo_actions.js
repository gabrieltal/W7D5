export const receiveTodos = todos => ({
  type: 'RECEIVE_TODOS',
  todos: todos
});

export const receiveTodo = todo => ({
  type: 'RECEIVE_TODO',
  todo: todo
});

export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';

// 1: {
//   id: 1,
//   title: 'wash car',
//   body: 'with soap',
//   done: false
// }
