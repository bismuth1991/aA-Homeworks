import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';

const Root = ({ store }) => (
  <Provider store={store}>
    <GiphysSearchContainer className="giphys-search-container" />
  </Provider>
);


export default Root;
