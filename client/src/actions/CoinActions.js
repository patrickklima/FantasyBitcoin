export const GET_COIN_INDEX_REQUEST = "GET_COIN_INDEX_REQUEST";
export const GET_COIN_INDEX_SUCCESS = "GET_COIN_INDEX_SUCCESS";
export const GET_COIN_INDEX_FAILURE = "GET_COIN_INDEX_FAILURE";

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
export const getCoinIndex = () => {
  //TO DO
  return;
};
