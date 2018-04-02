import React from 'react';
import { Link } from 'react-router';


const Greetings = (props) => (
  props.currentUser ? <h3>I cry</h3> : <h3>All the time</h3>
);


export default Greetings;
