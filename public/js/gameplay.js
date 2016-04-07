$(document).ready(function(){
  $('#game-show-page').on('click', '#start-game-button', function(e){
    e.preventDefault();
    var $this = $(this);
    var url = $this.attr('href');

    $.ajax({
      method: "GET",
      url: url
    })
    .done(function(){
      $('#start-game-button').remove();
    })
  })
 $('#game-show-page').on('click', '#join-game-button', function(e){
    e.preventDefault();
    var $joinButton = $(this);
    var url = $joinButton.attr('href');
    $.ajax({
      method: 'POST',
      url: url
    }).done(function(){
      $('#join-game-button').remove();

    })
  });
})
