function initialize() {
    var mapProp = {
    center: new google.maps.LatLng(41.8781, -87.6298),
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.SATELLITE
  };
 var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
};


function getMap() {
  var latitude = $(".latitude").text();
  var longitude = $(".longitude").text();

}
