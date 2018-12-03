import React from 'react';

const GiphysIndexItem = (props) => {
  const { giphy } = props;
  const gif = giphy.images.fixed_height.url;

  return (
    <li>
      <img src={gif} alt="" />
    </li>
  );
};

export default GiphysIndexItem;
