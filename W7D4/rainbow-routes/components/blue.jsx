import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Indigo from './indigo';

const Blue = () => (
  <div>
    <h2 className="blue" />

    <NavLink to="/blue/indigo">Indigo</NavLink>
    <Route path="/blue/indigo" component={Indigo} />
  </div>
);

export default Blue;
