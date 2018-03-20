import * as CoinActions from '../actions/CoinActions';

const initial = {
  coins: {
    index: {},
    symbolsOnDisplay: [],
    govDisplayCurrency: 'USD',
    cryptoDisplayCurrency: 'BTC',
    currentPage: 1,
    coinsPerPage: 10,
    rootImgUrl: '',
    isFetching: false,
    error: null
  },
};

const filterSymbolsOnDisplay = (coinIndex, currentPage, coinsPerPage) => {
  const startIndex = (currentPage - 1) * coinsPerPage;
  const endIndex = (currentPage) * coinsPerPage;
  const thisCoin = (symbol) => coinIndex[symbol];
  return Object.keys(coinIndex)
    .filter(symbol => {
      return (
        +thisCoin(symbol).SortOrder > startIndex
        &&
        +thisCoin(symbol).SortOrder <= endIndex
      );
    })
    .sort((symbolA, symbolB) => +thisCoin(symbolA).SortOrder > +thisCoin(symbolB).SortOrder);
};

const spreadIndexData = (coinIndex, newIndexData) => {
  return Object.keys(newIndexData).reduce((coinIndex, coinSymbol) => {
    return coinIndex[coinSymbol] = {
      ...coinIndex[coinSymbol],
      ...newIndexData[coinSymbol]
    };
  }, coinIndex);
};
export const coins = (state=initial.coins, action) => {
  switch (action.type) {
    case CoinActions.GET_COIN_INDEX_REQUEST:
    case CoinActions.GET_COIN_INDEX_DATA_REQUEST:
      return {
        ...state,
        isFetching: true,
        error: null
      };
    case CoinActions.GET_COIN_INDEX_SUCCESS:
      return {
        ...state,
        isFetching: false,
        error: null,
        rootImgUrl: action.data.BaseImageUrl,
        index: action.data.Data,
        symbolsOnDisplay: filterSymbolsOnDisplay(action.data.Data, state.currentPage, state.coinsPerPage)
      };
    case CoinActions.GET_COIN_INDEX_DATA_SUCCESS:
      return {
        ...state,
        isFetching: false,
        error: null,
        index: spreadIndexData(state.index, action.data.coins)
      };
    case CoinActions.GET_COIN_INDEX_FAILURE:
    case CoinActions.GET_COIN_INDEX_DATA_FAILURE:
      return {
        ...state,
        isFetching: false,
        error: action.data
      };
    case CoinActions.CHANGE_COINS_PER_PAGE:
      return {
        ...state,
        coinsPerPage: action.data,
        symbolsOnDisplay: filterSymbolsOnDisplay(state.index, state.currentPage, action.data)
      };
    case CoinActions.CHANGE_PAGE:
      return {
        ...state,
        currentPage: action.data,
        symbolsOnDisplay: filterSymbolsOnDisplay(state.index, action.data, state.coinsPerPage)
      };
    default:
      return state;
  }
};
