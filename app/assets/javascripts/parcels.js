
$(document).ready(function() {

  $('header').css({'height': 0.1*$('body').height()});
  $('#map').css({'height': $('body').height() - $('header').height() - 200});
  $('#parcel_content').css({'height': $('body').height() - $('header').height() - 200});

  var map = L.map('map').setView([51.505, -0.09], 13);

  L.tileLayer('http://{s}.tile.cloudmade.com/f57ba02c8691486fabf0baf62ac158c3/997/256/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    maxZoom: 18
  }).addTo(map);

  var parcels = $('#parcel_content').data('parcels')[0]; //each
  var marker = L.marker([51.5, -0.09]).addTo(map);
  marker.bindPopup("<center><b>"+parcels.title+"</b></center>"+parcels.description).openPopup();

  marker.on('click', function(e){
    $("#parcel_content").load("/parcels/9");
  });

});

