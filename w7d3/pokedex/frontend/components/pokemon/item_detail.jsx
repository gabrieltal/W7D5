import React from 'react';

class ItemDetail extends React.Component {
    constructor (props) {
      super(props);
    }

    render () {
      debugger;
      const items = this.props.items.map(item => <li>{item.name}</li>);

      return (
        <ul>
          {items}
        </ul>
      );
    }
}

export default ItemDetail;
