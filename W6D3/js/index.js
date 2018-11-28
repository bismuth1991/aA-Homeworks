console.log('Hello from the JavaScript console!');

// Your AJAX request here
function updatePage(data) {
  const $body = $('body');

  const $temp = $('<h4></h4>');
  $temp.text(`Temperature: ${data.main.temp}`);

  $body.append($temp);
}

$.ajax({
  url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b',
  type: 'GET',
  dataType: 'json',
  success(data) {
    console.log('Request sucessful');
    updatePage(data);
  },
});

// Add another console log here, outside your AJAX request
console.log('===================');
