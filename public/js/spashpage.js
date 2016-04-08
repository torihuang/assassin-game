$(document).ready(function() {
  if ( $('#game-location-map').length ) {
    getLatLng()
  }
  if (window.location.pathname == '/') {
    console.log("HERE")
    console.log(window.location.pathname);
    $('body').css('background-image', 'url(/imgs/backdrop.jpeg)');
    $('body').css('background-size', 'cover');
    $('body').css('background-color', 'black');
    $('header').css('display', 'none');
  }

  $('body').on('click','#login',function(e){
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: '/session/new'
    })
    .done(function(response) {
      if ($('#intro-buttons').has('#login-form').length > 0) {
        $('#login-form').remove();
      }
      else {
        $('#login').after(response);
      }
    })
  })

  $('body').on('click','#register',function(e){
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: '/users/new'
    })
    .done(function(response) {
      if ($('#intro-buttons').has('#new-user-form').length > 0) {
        console.log('remove!')
        $('#new-user-form').remove();
      }
      else {
        console.log('add!')
        $('#intro-buttons').append(response);
      }
    })
  })
});
