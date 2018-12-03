import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      searchTerm: '',
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    this.setState({ searchTerm: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();

    const { searchTerm } = this.state;
    const { fetchSearchGiphys } = this.props;

    fetchSearchGiphys(searchTerm);

    this.setState({ searchTerm: '' });
  }

  render() {
    const { searchTerm } = this.state;
    const { giphys } = this.props;

    return (
      <div>
        <form className="search-bar" onSubmit={this.handleSubmit}>
          <input
            type="text"
            value={searchTerm}
            onChange={this.handleChange}
          />

          <button type="submit">Search Giphy</button>
        </form>

        <GiphysIndex giphys={giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
