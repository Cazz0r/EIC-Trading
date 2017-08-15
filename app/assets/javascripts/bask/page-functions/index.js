page.index = {
  init: function() {
    // page.initPage(function() {});
  },
  submitSigninForm: function() {
    var username = $('#signin_username').val(), password = $('#signin_password').val();
    page.errors.clear();
    ShowLoading();
    $.post("/api/v1/sessions", {session: {username: username, password: password}})
    .done(function(response) {
      HideLoading();
      window.location = '/dashboard';
    })
    .fail(function(response) {
      HideLoading();
      page.errors.set(response.responseJSON);
    });
  }
}