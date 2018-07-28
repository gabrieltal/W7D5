import React from 'react';

class AutoComplete extends React.Component {
  constructor (props) {
    super(props);
    this.state = {
      searchInput: ""
    };
    this.handleInput = this.handleInput.bind(this);
    this.selectName = this.selectName.bind(this);
  }

  handleInput(event) {
    this.setState({
      searchInput: event.currentTarget.value
    });
  }

  matches() {
    const matches = [];
    if (this.state.searchInput.length === 0) {
      return this.props.names;
    }

    this.props.names.forEach(name => {
      let sub = name.slice(0, this.state.searchInput.length);
      if (sub.toLowerCase() === this.state.searchInput.toLowerCase()) {
        matches.push(name);
      }
    });

    if (matches.length === 0) {
      matches.push('No matches');
    }

    return matches;
  }

  selectName (event) {
    let name = event.currentTarget.innerText;
    this.setState({searchInput: name});
  }

  render () {
    let nameResults = this.matches().map( (name, idx) => {
      return (
        <li key={idx} onClick={this.selectName}>{name}</li>
      );
    });
    return (
      <div className="auto-Widget">
        <input onChange={this.handleInput}
        value={this.state.searchInput}
        placeholder='Search...'/>

        <ul>
          {nameResults}
        </ul>
      </div>
    );
  }
}

export default AutoComplete;
