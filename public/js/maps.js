function initMap(latitude, longitude) {

  var mapBox = document.getElementById('game-location-map');

  var mapOptions = {
    center: new google.maps.LatLng(latitude, longitude),
    zoom: 13,
  }
  var marker=new google.maps.Marker({
  position: mapOptions.center,
  });
  console.log(mapBox)
  var map = new google.maps.Map(mapBox, mapOptions)
  marker.setMap(map);
}

function getLatLng() {
  var address = $(".address").text()
  console.log(address)
  var addressObject = {"address": address}
  $.ajax({
    url: "/addresses",
    data: addressObject,
    method: "POST"
  }).done(function(response) {
    var lat = response.results[0].geometry.location.lat
    var lng = response.results[0].geometry.location.lng
    initMap(lat, lng)
  })
}
