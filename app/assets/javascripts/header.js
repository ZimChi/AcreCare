function sizeHeaderNav(){

   var screen_width = $('body').width() ;
   var screen_height = $('body').height() ;
   var button_height = 0.09 * screen_height ;
   var button_width = button_height ;

   //alert (button_width) ;

   $('#link_aff a img').css({'width':button_width},{'height':button_height});
   $('#info a img').css({'width':button_width},{'height':button_height});
   $('#link_gift a img').css({'width':button_width},{'height':button_height});

   $('#link_aff a img').css({'left':screen_width - (button_width + (0.4*button_width))});
   $('#info a img').css({'left':screen_width - 2*(button_width + (0.4*button_width))});
   $('#link_gift a img').css({'left':screen_width - 3*(button_width + (0.4*button_width))});
}

$(window).ready(function(){
 sizeHeaderNav() ;
 $( window ).resize(function() {
    sizeHeaderNav();
  });
});