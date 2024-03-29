page.accounts = {
  init: function() {
    // console.log('You are signed in!');
  },
  createAccount: function() {
    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/accounts',
      type: 'POST',
      data: page.accounts.getAccountFromForm(),
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        setTimeout(function(){ window.location = '/accounts/' + response.account.id; }, 200);
      },
      error: function(response) {
        HideLoading();
        page.errors.set(response.responseJSON);
      }
    });
  },
  updateAccount: function() {
    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/accounts/' + page.getId(),
      type: 'PUT',
      data: page.accounts.getAccountFromForm(),
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
  deleteAccount: function() {
    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/accounts/' + page.getId(),
      type: 'DELETE',
      data: {},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        setTimeout(function(){ window.location = '/accounts'; }, 200);
      },
      error: function(response) {
        HideLoading();
        page.errors.set(response.responseJSON);
      }
    });
  },
  depositWithdraw: function(current_credits) {
    var dw_val = $('#deposit_withdraw').val();
    if(blank(dw_val)) { return; }
    dw_val = dw_val.replace(/\s|\+/g, '');
    var new_credits = current_credits + parseInt(dw_val);
    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/accounts/' + page.getId(),
      type: 'PUT',
      data: { 'account[credits]': new_credits },
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
  depositWithdrawFrom: function(account_id, current_credits) {
    var dw_val = $('#deposit_withdraw').val();
    if(blank(dw_val)) { return; }
    dw_val = dw_val.replace(/\s|\+/g, '');
    var new_credits = current_credits + parseInt(dw_val);
    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/accounts/' + account_id,
      type: 'PUT',
      data: { 'account[credits]': new_credits },
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
  getAccountFromForm: function() {
    return {
      'account[name]': $('#account_name').val(),
      'account[discord_name]': $('#account_discord_name').val(),
      'account[account_type]': $('#account_account_type').val(),
      'account[credits]': $('#credit_count').val(),
    };
  }
}