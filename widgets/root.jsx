import React from 'react';
import Clock from "./frontend/clock";
import Tabs from "./frontend/tab";
import Weather from "./frontend/weather";
import AutoComplete from "./frontend/autocomplete";

const names = [
    'Timon',
    'Pumbaa',
    'Mufasa',
    'Zazu',
    'Scar',
    'Simba',
    'Nala',
    'Rafiki',
    'Sarabi',
  ];

const tabs = [
    {title: "one", content: "I am the first"},
    {title: "two", content: "Second pane here"},
    {title: "three", content: "Third pane here"}
  ];


class Root extends React.Component {
  constructor () {
    super();
  }

  render () {
    return (
      <div className="widget-Page">
        <h1 className="widget-title">Clock</h1>
        <Clock />
        <h1 className="widget-title">Tabs</h1>
        <Tabs tabs={tabs} />
        <h1 className="widget-title">Weather</h1>
        <Weather />
        <h1 className="widget-title">Autocomplete</h1>
        <AutoComplete names={names} />
      </div>
    );
  }
}

export default Root;
