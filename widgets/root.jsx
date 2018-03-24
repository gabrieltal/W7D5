import React from 'react';
import Clock from "./frontend/clock";
import Tabs from "./frontend/tab";

class Root extends React.Component {
  constructor () {
    super();
  }

  render () {
    let tabs = [
      {title: "one", content: "I am the first"},
      {title: "two", content: "Second pane here"},
      {title: "three", content: "Third pane here"}
    ];

    return (
      <div>
        <h1 className="widget-title">Clock</h1>
        <Clock />
        <h1 className="widget-title">Tabs</h1>
        <Tabs tabs={tabs} />

      </div>
    );
  }
}

export default Root;
