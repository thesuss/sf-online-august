var map;
$(document).ready(function(){
  map = new GMaps({
    div: '#map',
    lat: 57.7089,
    lng: 11.9746,
    width: '800px',
    height: '300px'
  });
  performGeolocation();
  addMarker();
});
function addMarker() {
  for (i = 0; i < gon.restaurants.length; i++) {
    map.addMarker({
        lat: gon.restaurants[0].latitude,
        lng: gon.restaurants[0].longitude,
    });
  }
}

function performGeolocation() {
  var latitude;
  var longitude;
  var testing_env = $('#map').data('test-env');
  if(testing_env == false) {
    GMaps.geolocate({
              success: function (position) {
                latitude = position.coords.latitude
                longitude = position.coords.longitude
                map.setCenter(latitude, longitude);

              },
              error: function (error) {
                  alert('Geolocation failed: ' + error.message);
              },
              not_supported: function () {
                  alert("Your browser does not support geolocation");
              }
          });
  } else {
    latitude = 59.3293235;
    longitude = 18.0685808;
    map.setCenter(latitude, longitude);
  }
}
