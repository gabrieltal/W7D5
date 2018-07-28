import React from 'react';
import { Link } from 'react-router-dom';

const welcomeUser = (currentUser, logout) => (
  <section>
    <h3>{currentUser.username}</h3>
    <button className="logout-button" onClick={logout}>Log Out</button>
  </section>
);

const newUser = () => (
  <nav className="new-user">
    <Link to='/login'>Log In</Link>
    <Link to='/signup'>Sign Up</Link>
  </nav>
);

const Greetings = (props) => {
  return props.currentUser ? welcomeUser(props.currentUser, props.logout) : newUser();
};


export default Greetings;
