import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const addLoggingToDispatch = store => next => (action) => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};

const logNext = store => next => (action) => {
  console.log('This is next!');
  console.log(next);
  console.log('-------------');
  next(action);
};

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch, logNext));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
