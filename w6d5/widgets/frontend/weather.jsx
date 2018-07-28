import React from 'react';
// /forecast?id=524901&APPID={}
const toQueryString = (obj) => {
  let parts = [];
  for (let i in obj) {
    if (obj.hasOwnProperty(i)) {
      parts.push(`${encodeURIComponent(i)}=${encodeURIComponent(obj[i])}`);
    }
  }
  return parts.join('&');
}

class Weather extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      weather: null
    };
    this.fetchWeather = this.fetchWeather.bind(this);
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.fetchWeather);
  }

  fetchWeather(location) {
    let latitude = location.coords.latitude;
    let longitude = location.coords.longitude;
    let url = 'http://api.openweathermap.org/data/2.5/weather?';
    let params = {
      lat: latitude,
      lon: longitude
    };
    url += toQueryString(params);
    const apiKey = '9a66058694dbed8b77d023468dab1fdb';
    url += `&APPID=${apiKey}`;

    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = () => {
      if (xmlhttp.status === 200 && xmlhttp.readyState === XMLHttpRequest.DONE) {
        const weatherData = JSON.parse(xmlhttp.responseText);
        this.setState({weather: weatherData});
      }
    };
    xmlhttp.open('GET', url, true);
    xmlhttp.send();
  }

  render () {
    let content = <div></div>;
    if (this.state.weather) {
      let weather = this.state.weather;
      let temp = (weather.main.temp - 273.15) * 1.8 + 32;
      content = <div className="weatherContent">
                  <p>{weather.name}</p>
                  <p>{temp.toFixed(1)} degrees</p>
                </div>;
    } else {
      content = <div className='loading'> Weather unavailable...</div>;
    }
    return (
      <div className="weather-Widget"> {content} </div>
    );
  }
}

export default Weather;
