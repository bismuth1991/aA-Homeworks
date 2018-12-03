// import * as APIUtil from '../util/api_util';
import fetchGiphys from '../util/api_util';

export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS';
export const REQUEST_SEARCH_GIPHYS = 'REQUEST_SEARCH_GIPHYS';

export const receiveSearchGiphys = giphys => ({
  type: RECEIVE_SEARCH_GIPHYS,
  giphys,
});

export const fetchSearchGiphys = searchTerm => (dispatch) => {
  fetchGiphys(searchTerm)
    .then(giphys => dispatch(receiveSearchGiphys(giphys.data)));
};
