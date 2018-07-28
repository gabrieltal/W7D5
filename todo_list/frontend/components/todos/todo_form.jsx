import React from 'react';
import createId from '../../util/create_id';
export default class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      id: 100,
      done: true
    };
    this.createNewTodo = this.createNewTodo.bind(this);
  }

  linkState(key) {
    console.dir(event.currentTarget);
    if (key === 'done') {
      let doneVal = false;
      if (this.state.done === "true" || this.state.done === true) {
        doneVal = true;
        console.log("inside if");
      }
      return (event => this.setState({[key]: doneVal}));
    } else {
      return (event => this.setState({[key]: event.currentTarget.value}));
    }
  }

  createNewTodo(e) {
    e.preventDefault();
    // this.state.id = createId();
    // debugger;
    this.setState({id: createId()});
    // this.checkBoxState();
    // this.linkState(e);
    console.log(this.props.receiveTodo);
    this.props.receiveTodo(this.state);
  }

  checkBoxState() {
    const checkbox = document.getElementById('done');
    checkbox.addEventListener('change', () => {
      console.log(checkbox);
      if (checkbox.value === "true") {
        this.setState({done: true});
      } else {
        this.setState({done: false});
      }
    });
  }

  render() {
    return (
      <form onSubmit={ this.createNewTodo }>
        <label>Title
        <input onChange={this.linkState('title')} type="text"
          value={this.state.title}/>
        </label>

        <br/>

        <label>Body
          <textarea onChange={this.linkState('body')}
            value={this.state.body}>Enter details</textarea>
        </label>

        <br/>

        <label>Done?
          <input onChange={this.linkState('done')} id="done"
            value={this.state.done}  type="checkbox"/>
        </label>

        <br/>
        <button id="submit-new-todo">Submit!</button>
      </form>
    );
  }
}
