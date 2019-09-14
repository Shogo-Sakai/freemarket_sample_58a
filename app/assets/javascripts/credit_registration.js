$(document).on('turbolinks:load',function(){
  $(".submit-btn").click(function() {
    $(".submit_btn").prop("disabled", true);
      var  number = $(".number").val();
        cvc = $(".cvc").val();
        exp_month = $(".exp_month").val();
        exp_year = $(".exp_year").val();
     var card = {
          number: number,
          cvc: cvc,
          exp_month: exp_month,
          exp_year: exp_year
      };
    Payjp.setPublicKey('pk_test_f638357dbba49468618ee91b');
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        $(".submit_btn").prop('disabled', false);
        return false;
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");

        var token = response.id;
        $.ajax({
          url: "/signup",
          type: "POST",
          data: {
            payjp_token: token
          },
          beforeSend: function(xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
          },
          async: false
        })
      }
    });
  });
});
