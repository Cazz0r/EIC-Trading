page.orders = {
  init: function() {
    // console.log('You are signed in!');
  },
  createOrder: function() {
    // Perform error checks
    page.errors.clear();
    if(blank($('#order_account_id').val())) {
      return page.errors.set(page.errors.custom("Please select an account for this order."));
    }
    if(blank($('#order_user_id').val())) {
      return page.errors.set(page.errors.custom("Please select a CMDR for this order."));
    }

    // Once error states pass, send the order to the server
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
    if(blank($('#order_user_id').val())) {
      return page.errors.set(page.errors.custom("Please select a CMDR for this order."));
    }

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
  getOrderFromForm: function() {
    return {
      'order[order_type]': $('#order_order_type').val(),
      'order[status]': $('#order_status').val(),
      'order[platform]': $('#order_platform').val(),
      'order[description]': $('#order_details').val(),
      'order[account_id]': $('#order_account_id').val(),
      'order[user_id]': $('#order_user_id').val(),
    };
  }
}