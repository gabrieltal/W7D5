import { connect } from 'react-redux';
import { login } from '../actions/session_actions';
import SessionForm from './session_form';
import React from 'react';
import { Link } from 'react-router-dom';

const mapStateToProps = (state, ownProps) => ({
  errors: state.errors,
  formType: 'login',
  navLink: <Link to="/signup">Sign up!</Link>
});

const mapDispatchToProps = (dispatch) => ({
  processForm: (user) => dispatch(login(user))
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
