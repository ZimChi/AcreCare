var colorbox = {up:false}
$(document).ready(function(){
  $.colorbox({href:'/about', transition:'none', scrolling: "false", width: $('body').width(), height: $('body').height(), opacity:1,
    onComplete: function() {
      $('#about').css('height','0px');
    }
  });
  $("#info").on('click', function(e){
    if(colorbox.up){
      colorbox.up = false;
      $('#about').css('height','0px');
    }else{
      colorbox.up = true;
      $('#about').css('height', 0.85*$('body').height());
    }
  });
});
