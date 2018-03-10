import React, { Component } from 'react';
import logo from '../logo.svg';
import '../App.css';
import { Button } from 'reactstrap';

class App extends Component {
  constructor() {
    super();
    this.state = {
      apiMessage: null
    };

    this.getResponse = this.getResponse.bind(this);
  }

  getResponse() {
    fetch('/test_data')
      .then(response => response.json())
      .then(responseObj => {
        this.setState({ apiMessage: responseObj.message });
      });
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        {this.state.apiMessage
          ? <p>{this.state.apiMessage}</p>
          : <Button color="success" onClick={this.getResponse}>Get Server Response</Button>
        }
      </div>
    );
  }
}

export default App;
