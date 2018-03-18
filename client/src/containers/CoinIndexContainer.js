import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { getCoinIndexData, changeCoinsPerPage, changePage } from '../actions/CoinActions';
import CoinIndex from '../components/CoinIndex';


const mapStateToProps = (state) => {
  return {
    coins: state.coins,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    getCoinIndexData: (symbolsOnDisplay, govDisplayCurrency, cryptoDisplayCurrency) => {
      return dispatch(
        getCoinIndexData(symbolsOnDisplay, govDisplayCurrency, cryptoDisplayCurrency)
      );
    },
    changeCoinsPerPage: (event) => dispatch(changeCoinsPerPage(event.target.value)),
    changePage: (event, page) => dispatch(changePage(page+1)),
  };
};



class CoinIndexContainer extends Component {
  constructor(props, context) {
    super(props, context);
  }

  componentDidMount() {
    const {getCoinIndexData, coins: 
      {symbolsOnDisplay, govDisplayCurrency, cryptoDisplayCurrency}
    } = this.props;
    getCoinIndexData(symbolsOnDisplay, govDisplayCurrency, cryptoDisplayCurrency);
  }
  
  render() {
    const {coins, changeCoinsPerPage, changePage} = this.props;
    console.log(this.props);
      return (
      <CoinIndex
        coins={coins}
        changeCoinsPerPage={changeCoinsPerPage}
        changePage={changePage}
      />
      );
    
  }
}

// CoinIndexContainer.propTypes = {
//   classes: PropTypes.object.isRequired,
// };

CoinIndexContainer = connect(mapStateToProps, mapDispatchToProps)(CoinIndexContainer);


export default CoinIndexContainer;


