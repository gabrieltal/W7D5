import store from '../store/store';

// const state = store.getState();

export const allTodos = ({todos}) => {
  return Object.keys(todos).map(id => todos[id]);
};
