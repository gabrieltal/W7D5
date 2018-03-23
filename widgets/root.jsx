import React from 'react';
import Clock from "./frontend/clock";
import Tabs from "./frontend/tab";

class Root extends React.Component {
  render () {
    return (
      <div>
        <h1 className="clock-title">Clock</h1>
        <Clock />
        <Tabs />
      </div>
    );
  }
}

export default Root;
