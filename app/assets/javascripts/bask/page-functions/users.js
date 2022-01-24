page.users = {
  makeUserAdmin: function(id) {
    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/users/' + id,
      type: 'PUT',
      data: {'user[admin]': true},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        setTimeout(function(){ location.reload(); }, 200);
      },
      error: function(response) {
        HideLoading();
        page.errors.set(response.responseJSON);
      }
    });
  },
  makeUserNotAdmin: function(id) {
    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/users/' + id,
      type: 'PUT',
      data: {'user[admin]': false},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        setTimeout(function(){ location.reload(); }, 200);
      },
      error: function(response) {
        HideLoading();
        page.errors.set(response.responseJSON);
      }
    });
  },
  setUserPassword: function(id) {
    page.errors.clear();
    var password = $('#new_password').val()
    console.log(password)
    ShowLoading();
    $.ajax({
      url: '/api/v1/users/' + id,
      type: 'PUT',
      data: {'user[password]': password},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        setTimeout(function(){ location.reload(); }, 200);
      },
      error: function(response) {
        HideLoading();
        page.errors.set(response.responseJSON);
      }
    });
  }
}