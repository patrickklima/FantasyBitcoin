import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { getCoinIndex } from '../actions/CoinActions';
import CoinIndex from '../components/CoinIndex';


const mapStateToProps = (state) => {
  return {
    coins: state.coins,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    getCoinIndex: () => dispatch(getCoinIndex()),
  };
};



class CoinIndexContainer extends Component {
  componentDidMount() {
    this.props.getCoinIndex();
  }
  
  render() {
    console.log(this.props);
    const {coins, getCoinIndex} = this.props;
      return (
      <CoinIndex
        coins={coins}
        getCoinIndex={getCoinIndex}
      />
      );
    
  }
}

CoinIndexContainer.propTypes = {
  classes: PropTypes.object.isRequired,
};

CoinIndexContainer = connect(mapStateToProps, mapDispatchToProps)(CoinIndexContainer);


export default CoinIndexContainer;


