import React, { Component } from 'react';
import { connect } from 'react-redux';
import '../App.css';
import MainNav from './MainNav';
import { getCoinIndex } from '../actions/CoinActions';
import { BrowserRouter as Router } from 'react-router-dom';

const mapStateToProps = (state) => {
  return {};
}
const mapDispatchToProps = dispatch => {
  return {
    getCoinIndex: () => dispatch(getCoinIndex()),
  };
}
class App extends Component {
  componentDidMount() {
    this.props.getCoinIndex();
  }
  
  render() {
    return (
      <Router>
        <div>
          <MainNav />
        </div>
      </Router>
    );
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(App);
