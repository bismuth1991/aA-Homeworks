import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Orange from './orange';
import Yellow from './yellow';

const Red = () => (
  <div>
    <h2 className="red" />

    <NavLink to="/red/orange">Orange</NavLink>
    <NavLink to="/red/yellow">Yellow</NavLink>

    <Route path="/red/orange" component={Orange} />
    <Route path="/red/yellow" component={Yellow} />
  </div>
);

export default Red;
