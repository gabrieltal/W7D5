import React from 'react';
import App from './components/app.jsx';
import { Provider } from 'react-redux';

const Root = ({store}) => (
  <Provider store={ store }>
    <App />
  </Provider>
);

// alternative syntax:
// const Root = ({store}) => {
//   console.dir(store);
//   return (
//   <Provider store={ store }>
//     <App />
//   </Provider>
// );
// };

// class Root extends React.Component {
//
//   render () {
//     return (
//       <div className="todo-Root">
//         <h1>Todos App</h1>
//         <App />
//       </div>
//     );
//   }
// }

export default Root;
