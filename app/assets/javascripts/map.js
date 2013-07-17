$(document).ready(function(){

  $("#image").fitVids();
  $('#map').css({'height': $('body').height() - $('header').height()});

  var center = [-11.9, -70.55],
      southWest = new L.LatLng(-18.64, -79.89),
      northEast = new L.LatLng(-2, -56),
      bounds = new L.LatLngBounds(southWest, northEast),
      initial_zoom = 8 ; if($('body').height()<600) initial_zoom = 7;

  var map = L.map('map', {
    center: center,
    zoom: initial_zoom,
    maxBounds: bounds
  });

  L.tileLayer('http://a.tiles.mapbox.com/v3/lxbarth.map-n8gsdqn4/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    maxZoom:12,
    minZoom:6
  }).addTo(map);

  var parcels = $('#parcel_content').data('parcels');
  var markers = [];

  $.each(parcels, function(index, parcel){

    var iconsize = .8 ;

    var markerIcon = L.icon({
      iconUrl: '/assets/'+parcel.icon,
      shadowUrl: '/assets/pin.png' ,
      iconSize:     [43.5*iconsize, 42*iconsize], // size of the icon
      shadowSize:   [60*iconsize, 88*iconsize], // size of the shadow
      iconAnchor:   [21*iconsize, 68.2*iconsize], // point of the icon which will correspond to marker's location
      shadowAnchor: [30*iconsize, 80*iconsize]  // the same for the shadow
      //popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
    });

    var marker = L.marker([parcel.latitude, parcel.longitude],{icon: markerIcon}).addTo(map);
    marker.on('click', function(e){
      window.location = "/parcels/"+parcel.id;
    });

    /* Enable draggable icons
    marker.dragging.enable();
    marker.on('dragend', function (e){
      var coords = e.target.getLatLng();
      var lat = coords.lat;
      var lng = coords.lng;
      alert('lat: '+lat+'\nlng: '+lng);
    });
    */

    markers.push(marker);
  });

});

