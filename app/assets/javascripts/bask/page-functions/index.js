page.index = {
  init: function() {
    // page.initPage(function() {});
  },
  submitSigninForm: function() {
    var username = $('#signin_username').val(), password = $('#signin_password').val(), alt_login = $('#alt_login').is(":checked");
    page.errors.clear();
    ShowLoading();
    var payload = {session: {username: username, password: password}}
    if(alt_login) payload.alt_login = true
    $.post("/api/v1/sessions", payload)
    .done(function(response) {
      HideLoading();
      setTimeout(function(){ window.location = '/accounts'; }, 200);
    })
    .fail(function(response) {
      HideLoading();
      page.errors.set(response.responseJSON);
    });
  }
}