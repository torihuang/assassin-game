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
})
