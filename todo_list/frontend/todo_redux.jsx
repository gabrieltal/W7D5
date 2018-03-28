import React from 'react';
import ReactDom from 'react-dom';
import Root from './root';
import configureStore from './store/store';
import { receiveTodos, receiveTodo } from './actions/todo_actions';
import { allTodos } from './reducers/selectors';
document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.allTodos = allTodos;
  ReactDom.render(<Root store={ store } />, root);
});
