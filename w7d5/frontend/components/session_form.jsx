import React from 'react';
import { withRouter, Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  update(field) {
    return (e) => this.setState({[field]: e.currentTarget.value}) ;
  }

  render () {
    return (
      <div>
        <h3>{this.props.formType}!</h3>
        <form onSubmit={this.handleSubmit}>

          <label>Username
            <input type="text" onChange={this.update('username')} value={this.state.username}/>
          </label>

          <label>Password
            <input type="password" onChange={this.update('password')} value={this.state.password}/>
          </label>

          <input type="submit" value={this.props.formType} />
        </form>
        {this.props.navLink}
      </div>
    );
  }
}

export default withRouter(SessionForm);
