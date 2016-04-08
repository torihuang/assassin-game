$(document).ready(function() {
  if (window.location.pathname == '/') {
    console.log("HERE")
    console.log(window.location.pathname);
    $('body').css('background-image', 'url(/imgs/backdrop.jpeg)');
    $('body').css('background-size', 'cover');
    $('body').css('background-color', 'black');
    $('header').css('display', 'none');
  }
});
