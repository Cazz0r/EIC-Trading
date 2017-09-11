var page = {
  initPage: function(func) {
    setTimeout(func, 0);
  },
  toggleElement: function(selector) {
    if($(selector).hasClass("hidden")) {
      $(selector).removeClass('hidden');
    } else {
      $(selector).addClass('hidden');
    }
  },
  getId: function() {
    var url =  window.location.href;
    return parseInt(url.substring(url.lastIndexOf('/') + 1));
  },
  errors: {
    clear: function() {
      $('div.errors').removeClass('show');
      $('div.errors p.detail').html('');
    },
    set: function(response) {
      $('div.errors').addClass('show');
      $('div.errors p.detail').html((blank(response) || blank(response.errors)) ? "Server error. Contact an admin." : response.errors[0].code == 0 ? capitalizeFirstLetter(response.errors[0].title) + ' ' + response.errors[0].detail : response.errors[0].detail);
    },
    custom: function(str) {
      return {
        errors: [{
          code: 100000,
          detail: str
        }]
      };
    }
  }
};