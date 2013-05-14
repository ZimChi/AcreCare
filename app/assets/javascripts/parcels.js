$(document).ready(function(){

  $('#map').css({'height': $('body').height() - $('header').height()});
  $('#parcel_content').css({'height': 0});
  
  var center = [-12.8, -70.802307],
      southWest = new L.LatLng(-18.64, -79.89),
      northEast = new L.LatLng(-2, -56),
      bounds = new L.LatLngBounds(southWest, northEast),
      initial_zoom = 7; if($('body').height()<300) initial_zoom = 6;
  
  var map = L.map('map', {
    center: center,
    zoom: initial_zoom,
    maxBounds: bounds
  });

  L.tileLayer('http://a.tiles.mapbox.com/v3/lxbarth.map-n8gsdqn4/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    maxZoom:12,
    minZoom:5
  }).addTo(map);

  var parcels = $('#parcel_content').data('parcels');
  var markers = [];

  $.each(parcels, function(index, parcel){
  
    var markerIcon = L.icon({
      iconUrl: '/assets/'+parcel.icon,
      shadowUrl: '/assets/pin.png' ,
      iconSize:     [29*0.5, 28*0.5], // size of the icon
      shadowSize:   [60*0.5, 88*0.5], // size of the shadow
      iconAnchor:   [15*0.5, 62*0.5], // point of the icon which will correspond to marker's location
      shadowAnchor: [30*0.5, 80*0.5]  // the same for the shadow
      //popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
    });

    var marker = L.marker([parcel.x, parcel.y],{icon: markerIcon}).addTo(map);

    marker.on('click', function(e){
      window.location = "/parcels/"+parcel.id;
    });
  
    marker.dragging.enable();
      
    marker.on('dragend', function (e){
      var coords = e.target.getLatLng();
      var lat = coords.lat;
      var lng = coords.lng;
      alert('lat: '+lat+'\nlng: '+lng);
    });

    markers.push(marker);
  });
});

