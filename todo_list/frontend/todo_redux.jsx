import React from 'react';
import ReactDom from 'react-dom';
import Root from './root';
import store from './store/store';
import { receiveTodos, receiveTodo } from './actions/todo_actions';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  window.store = store();
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  ReactDom.render(<Root store={store}/>, root);
});
