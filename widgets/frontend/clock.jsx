import React from 'react';

  class Clock extends React.Component{
    constructor(props) {
      super(props);
      this.state = {
        time: new Date()
      };
      this.tick = this.tick.bind(this);
      this.date = "";
      this.currentTime ="";
    }

    tick () {
      this.setState({
        time: new Date()
      });
      this.formateDate();
    }

    formateDate() {
      const time = this.state.time.toString().split(' ');
      this.date = time.slice(0,4).join(' ');
      this.currentTime = time.slice(4).join(' ');
    }

    render() {
      return (
        <div className="clock-widget">
          <div className="time">Date:<span>{this.date}</span></div>
          <div className="time">Time:<span>{this.currentTime}</span></div>
        </div>
      );

    }

    componentDidMount() {
      this.handle = setInterval(this.tick, 1000);

    }

    componentWillUnmount() {
      clearInterval(this.handle);
      this.handle = 0;
    }

  }





export default Clock;
