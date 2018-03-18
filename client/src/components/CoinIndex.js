import React from 'react';
import Table, 
  { TableBody, TableCell, TableHead, TableRow, TableFooter, TablePagination } 
    from 'material-ui/Table';
import { withStyles } from 'material-ui/styles';
import Paper from 'material-ui/Paper';

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

let CoinIndex = ({classes, coins, changeCoinsPerPage, changePage, }) => {
  const header = 
    <TableHead>
      <TableRow>
        <TableCell>#</TableCell>
        <TableCell>Logo</TableCell>
        <TableCell>Symbol</TableCell>
        <TableCell>Name</TableCell>
      </TableRow>
    </TableHead>;
  const coinsMap = coins.symbolsOnDisplay.map(symbol => {
    let thisCoin = coins.index[symbol];
    return (
      <TableRow  key={thisCoin.Name}>
        <TableCell>{thisCoin.SortOrder}</TableCell>
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
  const pagination = 
  <TableFooter>
    <TableRow>
      <TablePagination
        colSpan={6}
        count={Object.keys(coins.index).length}
        rowsPerPage={coins.coinsPerPage}
        page={coins.currentPage-1}
        backIconButtonProps={{
          'aria-label': 'Previous Page',
        }}
        nextIconButtonProps={{
          'aria-label': 'Next Page',
        }}
        onChangePage={changePage}
        onChangeRowsPerPage={changeCoinsPerPage}
        rowsPerPageOptions={[10,25,50]}
      />
    </TableRow>
  </TableFooter>;
  const coinsTable = 
    <Table className={classes.table}>
      {header}
      <TableBody>
        {coinsMap}
      </TableBody>
        {pagination}
    </Table>;
  return (
    <Paper className={classes.root}>
      {coins.isFetching 
        ? <p>Loading...</p> 
        : coinsTable}
    </Paper>
  );
}

CoinIndex = withStyles(styles, { withTheme: true })(CoinIndex);


export default CoinIndex;