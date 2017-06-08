function checkAdmin(){
  var adminstatus = $(event.target).attr('status');
    if (adminstatus == "true") {
      return "demote to student";
    } else {
      return "promote to admin";
    };
};

$(document).ready(function() {

  var changeRole = $('.toggle_admin');

  changeRole.on('click', function(event) {
    event.preventDefault();

    changeRole.attr('disabled', 'disabled');

    var userId = $(event.target).parent().attr('id');

    var url = "/settings/" + userId + ".json"
    var token = $('input[name=authenticity_token]').val();
    var user = $(event.target)

    $.ajax({
      url: url,
      type: 'PUT',
      contentType: 'application/json',
      data: JSON.stringify({

        authenticity_token: token,

      }),
      dataType: 'json',
    })
    .done(function(data) {

      $(event.target).text(checkAdmin);
      changeRole.attr('disabled', false);
    })
  });
})
