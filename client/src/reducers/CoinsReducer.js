import * as CoinActions from '../actions/CoinActions';

const initial = {
  coins: {
    index: {},
    rootImgUrl: '',
    isFetching: false,
    error: null
  },
};

export const coinIndexReducer = (state=initial.coins, action) => {
  switch (action.type) {
    case CoinActions.GET_COIN_INDEX_REQUEST:
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
        index: action.data.Data
      };
    case CoinActions.GET_COIN_INDEX_FAILURE:
      return {
        ...state,
        isFetching: false,
        error: action.data
      };
    default:
      return state;
  }
};