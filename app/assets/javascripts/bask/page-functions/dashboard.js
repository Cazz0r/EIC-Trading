page.dashboard = {
  init: function() {
    // console.log('You are signed in!');
  },
  signout: function() {
    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/sessions/1',
      type: 'DELETE',
      data: {},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        setTimeout(function(){ window.location = '/'; }, 200);
      },
      error: function(response) {
        HideLoading();
        page.errors.set(response.responseJSON);
      }
    });
  }
}