// Store locator with customisations
// - custom marker
// - custom info window (using Info Bubble)
// - custom info window content (+ store hours)

var ICON = new google.maps.MarkerImage('../../Images/parking.png', null, null,
    new google.maps.Point(14, 13));

var MY_LOCATION = new google.maps.MarkerImage('../../Images/location.png', null, null,
    new google.maps.Point(14, 13));

var SHADOW = new google.maps.MarkerImage('../../Images/parking.png', null, null,
    new google.maps.Point(14, 13));
var map, currentLocation;

google.maps.event.addDomListener(window, 'load', function () {
    map = new google.maps.Map(document.getElementById('map-canvas'), {
        center: new google.maps.LatLng(21.027425, 105.833426), // => Ha Noi
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var panelDiv = document.getElementById('panel');

    var data = new MedicareDataSource;

    var view = new storeLocator.View(map, data, {
        //geolocation: false,
        features: data.getFeatures()
    });

    view.createMarker = function (store) {
        var markerOptions = {
            position: store.getLocation(),
            icon: ICON,
            shadow: SHADOW,
            title: store.getDetails().title
        };
        return new google.maps.Marker(markerOptions);
    }

    var infoBubble = new InfoBubble;
    view.getInfoWindow = function (store) {
        if (!store) {
            return infoBubble;
        }

        var details = store.getDetails();
        var html = ['<div class="store"><div class="title">', details.title,
            '</div><div class="address">', details.address, '</div>',
            '</div><div class="phone">', details.phone, '</div>',
            '<div class="website">', details.website, '</div></div>'].join('');

        infoBubble.setContent($(html)[0]);
        return infoBubble;
    };

    new storeLocator.Panel(panelDiv, {
        view: view
    });
});

function getCurrentLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var current = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            var infoWindow = new google.maps.InfoWindow({
                content: "You are here."
            });
            var marker = new google.maps.Marker({
                'position': new google.maps.LatLng(current.lat, current.lng),
                'map': map,
                'title': 'You are here'
            });

            currentLocation = new google.maps.LatLng(current.lat, current.lng);
            $('.location-search input').val('My Location');

            marker.setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png')
            infoWindow.setPosition(current);
            //infoWindow.open(map, marker);
            google.maps.event.addListener(marker, 'click', function () {
                infoWindow.open(map, marker);
            });
            map.setCenter(current);
            map.setZoom(12);
        }, function () {
            handleLocationError(true, infoWindow, map.getCenter());
        });
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
    }
}