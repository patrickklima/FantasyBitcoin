import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { getCoinIndex, getCoinIndexData, getCoinIndexThenData, changeCoinsPerPage, changePage } from '../actions/CoinActions';
import CoinIndex from '../components/CoinIndex';


const mapStateToProps = (state) => {
  return {
    coins: state.coins,
  };
};

const mapDispatchToProps = (dispatch) => {
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
      symbolsOnDisplay,
      govDisplayCurrency,
      cryptoDisplayCurrency,
      getCoinIndexThenData,
      getCoinIndexData
    } = this.props;
    if (!symbolsOnDisplay || symbolsOnDisplay.length === 0) {
      this.props.getCoinIndexThenData();
    } else {
      getCoinIndexData(symbolsOnDisplay, govDisplayCurrency, cryptoDisplayCurrency);
    }
  }

  render() {
    const {coins, changeCoinsPerPage, changePage} = this.props;
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


