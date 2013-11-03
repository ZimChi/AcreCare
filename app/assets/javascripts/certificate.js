$(document).ready(function(){

    $('.generate_btn').on('click', function(e){
        $('#light').css({'display' : 'block'});
        $('#fade').css({'display' : 'block'});

        var dataString = '?&certificate_acrename=' + $('#certificate_acrename').val()
            +'&certificate_recipient_firstname='+$('#certificate_recipient_firstname').val()
            +'&certificate_recipient_lastname='+$('#certificate_recipient_lastname').val()
            +'&certificate_recipientemail='+$('#certificate_recipientemail').val()
            +'&certificate_personalizedmessage='+$('#certificate_personalizedmessage').val()
            + '&authenticity_token='+$('#authenticity-token').attr('content');

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

  $('.ecard_btn').on('click', function(e){
        $('#light').css({'display' : 'block'});
        $('#fade').css({'display' : 'block'});

      var dataString = '?&certificate_acrename=' + $('#certificate_acrename').val()
          +'&certificate_recipient_firstname='+$('#certificate_recipient_firstname').val()
          +'&certificate_recipient_lastname='+$('#certificate_recipient_lastname').val()
          +'&certificate_recipientemail='+$('#certificate_recipientemail').val()
          +'&certificate_personalizedmessage='+$('#certificate_personalizedmessage').val()
          + '&authenticity_token='+$('#authenticity-token').attr('content');

        $.fileDownload('/ecard'+dataString,{
            successCallback: function () {
                $('#light').css({'display' : 'none'});
                $('#fade').css({'display' : 'none'});
                alert('email delivered, check your inbox for confirmation');
            },
            failCallback: function () {
                $('#light').css({'display' : 'none'});
                $('#fade').css({'display' : 'none'});
            }
        });
        return false ;
  });

});