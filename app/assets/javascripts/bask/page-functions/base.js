var page = {
  initPage: function(func) {
    setTimeout(func, 0);
  },
  errors: {
    clear: function() {
      $('div.errors').removeClass('show');
      $('div.errors p.detail').html('');
    },
    set: function(response) {
      $('div.errors').addClass('show');
      $('div.errors p.detail').html((blank(response) || blank(response.errors)) ? "Server error. Contact an admin." : response.errors[0].detail);
    }
  }
};