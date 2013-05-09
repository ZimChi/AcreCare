$(document).ready(function() {

  $('#map').css({'height': $('body').height() - $('header').height()});
  $('#parcel_content').css({'height': 0});

  var map = L.map('map').setView([51.505, -0.09], 13);

  L.tileLayer('http://{s}.tile.cloudmade.com/f57ba02c8691486fabf0baf62ac158c3/997/256/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    maxZoom: 18
  }).addTo(map);

  var parcels = $('#parcel_content').data('parcels');

  var markers = [] ;

  $.each(parcels, function(index, parcel) {

    var marker = L.marker([51.5+.01*index, -0.09]).addTo(map);
    //marker.bindPopup("<center><b>"+parcel.title+"</b></center>"+parcel.description).openPopup();

    marker.on('click', function(e){
      $("#parcel_content").load("/parcels/"+parcel.id);
      $("#parcel_content").css({'height': $('body').height() *.3});
      $('#map').css({'height': $('body').height() - $('header').height() - $('#parcel_content').height()});

    });

    markers.push(marker);
  });


});

