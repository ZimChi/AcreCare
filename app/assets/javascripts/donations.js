
$(document).ready(function(){
   $('#donation_gift').on('click', function(e){
     if (this.checked){
       $('#ecarddetailhint').css({'display' : 'block'});
       $('#ecarddetailhint').css({'display' : 'block'});
       $('#donation_acrename').css({'display' : 'block'});
       $('#donation_gift_sender_name').css({'display' : 'block'});
       $('#donation_recipient_firstname').css({'display' : 'block'});
       $('#donation_recipient_email').css({'display' : 'block'});
       $('#donation_message').css({'display' : 'block'});
       $('#donation_recipient_lastname').css({'display' : 'block'});


     } else {
       $('#ecarddetailhint').css({'display' : 'none'});
       $('#donation_acrename').css({'display' : 'none'});
       $('#donation_gift_sender_name').css({'display' : 'none'});
       $('#donation_recipient_firstname').css({'display' : 'none'});
       $('#donation_recipient_email').css({'display' : 'none'});
       $('#donation_message').css({'display' : 'none'});
       $('#donation_recipient_lastname').css({'display' : 'none'});

     }
   });
});

