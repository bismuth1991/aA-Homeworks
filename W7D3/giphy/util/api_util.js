const fetchGiphys = searchTerm => $.ajax({
  type: 'GET',
  url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm.split(' ').join('+')}&api_key=dc6zaTOxFJmzC&limit=5`,
});

export default fetchGiphys;
