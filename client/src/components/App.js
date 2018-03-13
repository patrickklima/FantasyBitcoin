import React, { Component } from 'react';
import logo from '../logo.svg';
import '../App.css';
import PortfolioContainer from '../containers/PortfolioContainer';
import CoinIndexContainer from '../containers/CoinIndexContainer';
import TransactionsContainer from '../containers/TransactionsContainer';
import {
  NavLink, 
  // Link,
  BrowserRouter as Router, 
  Switch, 
  Route
} from 'react-router-dom';
import { Button } from 'reactstrap';

const Home = () => {
  return (
    <div>
      <h2>Home</h2>
    </div>
  );
}

const Test = () => {
  return (
    <div>
      <h2>Test</h2>
    </div>
  );
}

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
      <Router>
        <div>
          <NavLink to='/'>Home</NavLink><br />
          <NavLink to='/test'>Test</NavLink><br />
          <NavLink to='/portfolio'>Portfolio</NavLink><br />
          <NavLink to='/coins'>Coins</NavLink><br />
          <NavLink to='/transactions'>Transactions</NavLink><br />
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
          <Switch>
            <Route exact path='/' component={Home}/>
            <Route path='/test' component={Test}/>
            <Route path='/portfolio' component={PortfolioContainer}/>
            <Route path='/coins' component={CoinIndexContainer}/>
            <Route path='/transactions' component={TransactionsContainer}/>
          </Switch>
        </div>
      </Router>
    );
  }
}

export default App;
