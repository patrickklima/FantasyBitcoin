import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { getCoinIndex, changeCoinsPerPage, changePage } from '../actions/CoinActions';
import CoinIndex from '../components/CoinIndex';


const mapStateToProps = (state) => {
  return {
    coins: state.coins,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    getCoinIndex: () => dispatch(getCoinIndex()),
    changeCoinsPerPage: (e) => dispatch(changeCoinsPerPage(e.target.value)),
    changePage: (e) => dispatch(changePage(e.target.value)),
  };
};



class CoinIndexContainer extends Component {
  constructor(props, context) {
    super(props, context);
  }

  componentDidMount() {
    this.props.getCoinIndex();
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


