var map;
$(document).ready(function () {
    map = new GMaps({
        div: '#map',
        lat: 57.7089,
        lng: 11.9746
    });
    performGeolocation();
    addMarkers();
});
function addMarkers() {
    if (gon.restaurants) {
        gon.restaurants.forEach(function (restaurant) {
            map.addMarker({
                lat: restaurant.lattitude,
                lng: restaurant.longitude
            });
        })
    }
}
function performGeolocation() {
    var latitude;
    var longitude;
    var testing_env = $('#map').data().testEnv;
    if (testing_env == false) {
        GMaps.geolocate({
            success: function (position) {
                latitude = position.coords.latitude;
                longitude = position.coords.longitude;
                map.setCenter(latitude, longitude);
            },
            error: function (error) {
                alert('Geolocation failed: ' + error.message);
            },
            not_supported: function () {
                alert('Your browser does not support geolocation');
            }
        });
    } else {
        latitude = 59.3293235;
        longitude = 18.0685808;
        map.setCenter(latitude, longitude);
    }
}
