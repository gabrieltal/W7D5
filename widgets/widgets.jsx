import React from 'react';
import ReactDom from 'react-dom';
import Clock from "./frontend/clock";


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDom.render(<Root />, root);
});

import Root from "./root";
