export const GET_COIN_INDEX_REQUEST = "GET_COIN_INDEX_REQUEST";
export const GET_COIN_INDEX_SUCCESS = "GET_COIN_INDEX_SUCCESS";
export const GET_COIN_INDEX_FAILURE = "GET_COIN_INDEX_FAILURE";

const apiCoinListUrl = 'https://www.cryptocompare.com/api/data/coinlist/';

export const getCoinIndex = () => {
  return (dispatch) => {
    dispatch(getCoinIndexRequest());
    fetch(apiCoinListUrl, {
      method: 'GET', 
      mode: 'cors',
    })
    .then(res => {
      if (!res.ok) {
        throw new Error(`${res.statusText}: ${res.error}`)
      }
      return res.json();
    })
    .then(json => dispatch(getCoinIndexSuccess(json)))
    .catch(error => dispatch(getCoinIndexFailure(error)));
  };
};

export const getCoinIndexRequest = () => {
  return {
    type: GET_COIN_INDEX_REQUEST,
  };
};
export const getCoinIndexSuccess = (data) => {
  return {
    type: GET_COIN_INDEX_SUCCESS,
    data: data
  };
};
export const getCoinIndexFailure = (error) => {
  return {
    type: GET_COIN_INDEX_FAILURE,
    data: error
  };
};
