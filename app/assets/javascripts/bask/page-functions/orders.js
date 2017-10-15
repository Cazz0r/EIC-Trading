page.orders = {
  new_account_id: null,
  init: function() {
    // console.log('You are signed in!');
  },
  clearNewAccount: function() {
    $('#account_name').val(null);
    page.orders.new_account_id = null;
  },
  createOrder: function() {
    // Perform error checks
    page.errors.clear();
    if(!page.orders.hasNewAccountOnOrder() && blank($('#order_account_id').val())) {
      return page.errors.set(page.errors.custom("Please select an account for this order."));
    }

    // We no longer require a user to be assigned to orders, but this is the check for whenever we turn that on again.
    // if(blank($('#order_user_id').val())) {
    //   return page.errors.set(page.errors.custom("Please select a CMDR for this order."));
    // }

    // Once error states pass, send the order to the server and create new account if a name exists
    ShowLoading();
    if(page.orders.hasNewAccountOnOrder()) {
      $.ajax({
        url: '/api/v1/accounts',
        type: 'POST',
        data: page.accounts.getAccountFromForm(),
        traditional: true,
        dataType: 'json',
        success: function(response) {
          page.orders.new_account_id = response.account.id;
          page.orders.sendNewOrderToServer();
        },
        error: function(response) {
          HideLoading();
          page.errors.set(response.responseJSON);
        }
      });

    // If we don't have a new account on the order then just send the order as-is.
    } else {
      page.orders.sendNewOrderToServer();
    }
  },
  sendNewOrderToServer: function() {
    ShowLoading();
    $.ajax({
      url: '/api/v1/orders',
      type: 'POST',
      data: page.orders.getOrderFromForm(),
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        setTimeout(function(){ window.location = '/orders/' + response.order.id; }, 200);
      },
      error: function(response) {
        HideLoading();
        page.errors.set(response.responseJSON);
      }
    });
  },
  updateOrder: function() {
    // Perform error checks
    page.errors.clear();
    if(blank($('#order_account_id').val())) {
      return page.errors.set(page.errors.custom("Please select an account for this order."));
    }

    // We no longer require a user to be assigned to orders, but this is the check for whenever we turn that on again.
    // if(blank($('#order_user_id').val())) {
    //   return page.errors.set(page.errors.custom("Please select a CMDR for this order."));
    // }

    // Once error states pass, send the order to the server
    ShowLoading();
    $.ajax({
      url: '/api/v1/orders/' + page.getId(),
      type: 'PUT',
      data: page.orders.getOrderFromForm(),
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
  deleteOrder: function() {
    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/orders/' + page.getId(),
      type: 'DELETE',
      data: {},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        setTimeout(function(){ window.location = '/orders'; }, 200);
      },
      error: function(response) {
        HideLoading();
        page.errors.set(response.responseJSON);
      }
    });
  },
  hasNewAccountOnOrder: function() {
    return !blank($('#account_name').val());
  },
  getOrderFromForm: function() {
    return {
      'order[order_type]': $('#order_order_type').val(),
      'order[status]': $('#order_status').val(),
      'order[platform]': $('#order_platform').val(),
      'order[description]': $('#order_details').val(),
      'order[account_id]': blank(page.orders.new_account_id) ? $('#order_account_id').val() : page.orders.new_account_id,
      'order[user_id]': blank($('#order_user_id').val()) ? null : $('#order_user_id').val()
    };
  }
}