var map, infoWindow, currentLocation;
function loadData() {
    // This makes the div with id "map_canvas" a google map
    google.maps.visualRefresh = true;
    var HaNoi = new google.maps.LatLng(21.027425, 105.833426);

    // These are options that set initial zoom level, where the map is centered globally to start, and the type of map to show
    var mapOptions = {
        zoom: 10,
        center: HaNoi,
        mapTypeId: google.maps.MapTypeId.G_NORMAL_MAP
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    GetCurrentLocation();
    $.ajax({
        url: "../Home/List",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $.each(result, function (key, item) {
                //console.log(item);
                var marker = new google.maps.Marker({
                    'position': new google.maps.LatLng(item.Lat, item.Lng),
                    'map': map,
                    'title': item.Name
                });
                marker.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png')

                var infoWindow = new google.maps.InfoWindow({
                    content: item.Name
                });

                // finally hook up an "OnClick" listener to the map so it pops up out info-window when the marker-pin is clicked!
                google.maps.event.addListener(marker, 'click', function () {
                    infoWindow.open(map, marker);
                });
            });
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}
function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
        'Error: The Geolocation service failed.' :
        'Error: Your browser doesn\'t support geolocation.');
    infoWindow.open(map);
}

function GetCurrentLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            currentLocation = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };

            var infoWindow = new google.maps.InfoWindow({
                content: "You are here."
            });
            var marker = new google.maps.Marker({
                'position': new google.maps.LatLng(currentLocation.lat, currentLocation.lng),
                'map': map,
                'title': 'You are here'
            });
            marker.setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png')
            infoWindow.setPosition(currentLocation);
            infoWindow.open(map, marker);
            google.maps.event.addListener(marker, 'click', function () {
                infoWindow.open(map, marker);
            });
            map.setCenter(currentLocation);
            map.setZoom(15);
        }, function () {
            handleLocationError(true, infoWindow, map.getCenter());
        });
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
    }
}