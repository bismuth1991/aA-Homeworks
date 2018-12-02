import React from 'react';
import ReactDOM from 'react-dom';
import Widget from './components/widget';
import store from './store';

import selectLocation from './actions';
import reducer from './reducer';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Widget store={store} />, document.getElementById('root'));
});

window.selectLocation = selectLocation;
window.store = store;
window.reducer = reducer;
