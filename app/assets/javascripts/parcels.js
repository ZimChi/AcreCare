$(document).ready(function() {

  $('#map').css({'height': $('body').height() - $('header').height()});
  $('#parcel_content').css({'height': 0});

  var map = L.map('map').setView([-11.8, -70.802307], 7);

  L.tileLayer('http://a.tiles.mapbox.com/v3/lxbarth.map-n8gsdqn4/{z}/{x}/{y}.png', {
    //attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
   // maxZoom:18
  }).addTo(map);

  var parcels = $('#parcel_content').data('parcels');

  var markers = [] ;

  $.each(parcels, function(index, parcel) {

    var marker = L.marker([parcel.x, parcel.y]).addTo(map);
    //marker.bindPopup("<center><b>"+parcel.title+"</b></center>"+parcel.description).openPopup();

    marker.on('click', function(e){
      $("#parcel_content").load("/parcels/"+parcel.id);
      $("#parcel_content").css({'height': 50});
      $('#map').css({'height': $('body').height() - $('header').height() - $('#parcel_content').height()});
        var map = L.map('map').setView([-11.8, -70.802307], 5);
    });

    markers.push(marker);
  });


});

