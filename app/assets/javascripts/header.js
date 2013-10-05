function sizeHeaderNav(){
    var screen_width = $('body').width() ;
    var button_width = $('#info a img').width();
    $('#link_aff a img').css({'left':screen_width - button_width - (0.2*button_width) });
    $('#info a img').css({'left':screen_width - button_width - button_width - (0.4*button_width)});
}

$(document).ready(function(){
  sizeHeaderNav();
  $( window ).resize(function() {
    sizeHeaderNav();
  });
});