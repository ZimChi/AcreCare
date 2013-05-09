var colorbox = {up:false}
$(document).ready(function(){
  $("#info").click(function(){
    if(colorbox.up){
      colorbox.up = false;
      $('#about').hide();
      $.colorbox.close() ;
    }else{
      colorbox.up = true;
      $.colorbox({href:'/about',
                  transition:'none',
                  scrolling: "false",
                  width: $('body').width(),
                  height: $('body').height(),
                  opacity:1
                }
      );
     }
  });
});
