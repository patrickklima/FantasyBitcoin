import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { getCoinIndex } from '../actions/CoinActions';
import { Table } from 'reactstrap';


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
    const {coins} = this.props;
    const coinsMap = Object.keys(coins.index).map(coinSymbol => {
      let thisCoin = coins.index[coinSymbol];
      return (
        <tr key={thisCoin.Name}>
          <th scope="row">{thisCoin.SortOrder}</th>
          <td>
            <img 
              src={`${coins.rootImgUrl}/${thisCoin.ImageUrl}`} 
              alt={thisCoin.Name}
              height={50}
            />
          </td>
          <td>{thisCoin.Name}</td>
          <td>{thisCoin.CoinName}</td>
       </tr>
     
      );
    });
    const coinsTable = 
      <Table
        size={'sm'}
        bordered={true}
        striped={true} 
        dark={false} 
        hover={true} 
        responsive={true}
      >
        <thead>
          <tr>
            <th>#</th>
            <th>Logo</th>
            <th>Symbol</th>
            <th>Name</th>
          </tr>
        </thead>
        <tbody>
          {coinsMap}
        </tbody>
      </Table>;
    return (
      <div>
        {coins.isFetching 
          ? <p>Loading...</p> 
          : coinsTable}
      </div>
    );
  }
}

CoinIndexContainer.propTypes = {

};

export default connect(mapStateToProps, mapDispatchToProps)(CoinIndexContainer);


