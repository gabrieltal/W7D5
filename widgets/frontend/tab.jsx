import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
      super(props);
      this.state = {
        index: 0
      };
  }

  render () {
    return (
      <div className="tab-widget">
        <ul>
          <h1>Hi</h1>
          <h1>bye</h1>
          <h1></h1>
        </ul>

        <article></article>
      </div>
    );
  }


}
export default Tabs;
