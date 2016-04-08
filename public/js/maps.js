function initMap() {
  var latitude = $(".latitude").text();
  var longitude = $(".longitude").text();
  var mapBox = document.getElementById('game-location-map');

  var mapOptions = {
    center: new google.maps.LatLng(latitude, longitude),
    zoom: 13
  }

  console.log(mapBox)
  var map = new google.maps.Map(mapBox, mapOptions)
}
