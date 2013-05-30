$(document).ready(function(){
  $('.generate_btn').on('click', function(e){
    $('#light').css({'display' : 'block'});
    $('#fade').css({'display' : 'block'});

    var dataString = '?&acrename=' + $('#certificate_acrename').val() + '&authenticity_token='+$('#authenticity-token').attr('content');

    $.fileDownload('/certificate'+dataString,{
      successCallback: function () {
        $('#light').css({'display' : 'none'});
        $('#fade').css({'display' : 'none'});
      },
      failCallback: function () {
        $('#light').css({'display' : 'none'});
        $('#fade').css({'display' : 'none'});
      }
    });
  return false ;
  });
});