/*
 * Home
 *
 * This is the first thing users see of our App, at the '/' route
 *
 * NOTE: while this component should technically be a stateless functional
 * component (SFC), hot reloading does not currently support SFCs. If hot
 * reloading is not a necessity for you then you can refactor it and remove
 * the linting exception.
 */

import * as React from 'react';
import './styles'

export default function Home() {
  return (
    <section id="Home" className="hero is-primary is-fullheight">
      <div className="hero-body">
        <div className="container temp">
          <div className="title is-size-1">
            Hello,
          </div>
          <div className="subtitle">
            brb.
          </div>
        </div>
        <p className="is-size-7 tag">production test</p>
      </div>
    </section>
  );
}
