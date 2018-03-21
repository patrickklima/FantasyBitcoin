import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { withStyles } from 'material-ui/styles';
import { getCoinIndex } from '../actions/CoinActions';
import Table, { TableBody, TableCell, TableHead, TableRow } from 'material-ui/Table';
import Paper from 'material-ui/Paper';


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

const styles = theme => ({
  root: {
    width: '100%',
    marginTop: theme.spacing.unit * 3,
    overflowX: 'auto',
  },
  table: {
    minWidth: 700,
    logoImgHeight: 40
  },
});

class CoinIndexContainer extends Component {
  componentDidMount() {
    this.props.getCoinIndex();
  }
  
  render() {
    const {coins, classes} = this.props;
    const coinsMap = Object.keys(coins.index).map(coinSymbol => {
      let thisCoin = coins.index[coinSymbol];
      return (
        <TableRow  key={thisCoin.Name}>
          <th scope="row">{thisCoin.SortOrder}</th>
          <TableCell>
            <img 
              src={`${coins.rootImgUrl}/${thisCoin.ImageUrl}`} 
              alt={thisCoin.Name}
              height={40}
            />
          </TableCell>
          <TableCell>{thisCoin.Name}</TableCell>
          <TableCell>{thisCoin.CoinName}</TableCell>
       </TableRow>
     
      );
    });
    const coinsTable = 
      <Table className={classes.table}>
        <TableHead>
          <TableRow>
            <TableCell>#</TableCell>
            <TableCell>Logo</TableCell>
            <TableCell>Symbol</TableCell>
            <TableCell>Name</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
        {coinsMap}
        </TableBody>
      </Table>;
    return (
      <Paper className={classes.root}>
        {coins.isFetching 
          ? <p>Loading...</p> 
          : coinsTable}
      </Paper>
    );
  }
}

CoinIndexContainer.propTypes = {
  classes: PropTypes.object.isRequired,
};

CoinIndexContainer = withStyles(styles, { withTheme: true })(CoinIndexContainer);
CoinIndexContainer = connect(mapStateToProps, mapDispatchToProps)(CoinIndexContainer);

export default CoinIndexContainer;


