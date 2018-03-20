import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { getCoinIndex, getCoinIndexData, getCoinIndexThenData, changeCoinsPerPage, changePage } from '../actions/CoinActions';
import filterSymbolsOnDisplay from '../services/filterSymbolsOnDisplayService';
import CoinIndex from '../components/CoinIndex';


const mapStateToProps = (state) => {
  return {
    coins: state.coins,
  };
};

const mapDispatchToProps = (dispatch, getState) => {
  return {
    getCoinIndex: () => dispatch(getCoinIndex()),
    getCoinIndexData: (symbolsOnDisplay, govDisplayCurrency, cryptoDisplayCurrency) => {
      return dispatch(
        getCoinIndexData(symbolsOnDisplay, govDisplayCurrency, cryptoDisplayCurrency)
      );
    },
    getCoinIndexThenData: () => dispatch(getCoinIndexThenData()),
    changeCoinsPerPage: (event) => dispatch(changeCoinsPerPage(event.target.value)),
    changePage: (event, page) => dispatch(changePage(page+1)),
  };
};

class CoinIndexContainer extends Component {
  componentDidMount() {
    const {
      coins: {
        index,
        currentPage, 
        coinsPerPage,
        govDisplayCurrency, 
        cryptoDisplayCurrency,
      },
      getCoinIndexThenData, 
      getCoinIndexData
    } = this.props;
    const symbolsOnDisplay = filterSymbolsOnDisplay(index, currentPage, coinsPerPage);
    if (!symbolsOnDisplay || symbolsOnDisplay.length === 0) {
      this.props.getCoinIndexThenData();
    } else {
      getCoinIndexData(symbolsOnDisplay, govDisplayCurrency, cryptoDisplayCurrency);
    }
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


