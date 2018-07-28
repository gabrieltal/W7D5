import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
      super(props);
      this.state = {
        selectedIndex: 0
      };
  }

  handleClick (selectedIndex) {
    this.setState({
      selectedIndex
    });
  }
  render () {
    // let tabs = [];
    // for (var i = 0; i < 3; i++) {
    //   tabs.push(<h1>this.props.tabs[i].title</h1>);
    // }
    // let tabs = this.props.tabs.map((tab) => <li>{tab.title}</li>);
    let tabs = [
      <li key={0} onClick={() => this.handleClick(0)}>{this.props.tabs[0].title}</li>,
      <li key={1} onClick={() => this.handleClick(1)}>{this.props.tabs[1].title}</li>,
      <li key={2} onClick={() => this.handleClick(2)}>{this.props.tabs[2].title}</li>
    ];
    return (
      <div className="tab-widget">
        <ul className="tab-Ul">
          {tabs}
        </ul>

        <article className="tab-Panel">
          {this.props.tabs[this.state.selectedIndex].content}
        </article>
      </div>
    );
  }


}
export default Tabs;
