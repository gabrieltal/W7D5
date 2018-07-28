import React from 'react';

export default class TodoListItem extends React.Component {
  render() {
    return (
      <li > {this.props.item.title } </li>
    );
  }
}
