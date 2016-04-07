$(document).ready(function() {
  $(".game_summary").each(function(summaryBox) {
    var box = $(this)
    var latitude = $(".latitude").text();
    var longitude = $(".longitude").text();


      var mapProp = {
        center: new google.maps.LatLng(latitude, longitude),
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
    // console.log(map)


     var map=new google.maps.Map(document.getElementsByClass("game-location-map"), mapProp)
    // var appendToThis = box.find(".game-location-map").replaceWith(map)



  });
});

