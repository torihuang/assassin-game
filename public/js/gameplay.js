$(document).ready(function(){
  $('#game-show-page').on('click', '#start-game-button', function(e){
    e.preventDefault();
    var $this = $(this);
    var url = $this.url;

    $.ajax({
      method: "GET",
      url: url
    })
    .done(function(response){

    })
  })
})
