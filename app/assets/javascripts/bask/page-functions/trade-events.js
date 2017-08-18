page.tradeEvents = {
  createTradeEvent: function() {
    var content = $('#trade_event_input').val();
    if(blank(content)) { return; }

    ShowLoading();
    $.ajax({
      url: '/api/v1/trade_events',
      type: 'POST',
      data: {'trade_event[content]': content, 'trade_event[account_id]': page.getId()},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        location.reload();
      },
      error: function(response) {
        HideLoading();
        page.errors.set(response.responseJSON);
      }
    });
  },
  updateTradeEvent: function(id) {
    var content = $('#trade_event_input_' + id).val();
    if(blank(content)) { return; }

    ShowLoading();
    $.ajax({
      url: '/api/v1/trade_events/' + id,
      type: 'PUT',
      data: {'trade_event[content]': content},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        location.reload();
      },
      error: function(response) {
        HideLoading();
        page.errors.set(response.responseJSON);
      }
    });
  },
  deleteTradeEvent: function(id) {
    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/trade_events/' + id,
      type: 'DELETE',
      data: {},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        location.reload();
      },
      error: function(response) {
        HideLoading();
        page.errors.set(response.responseJSON);
      }
    });
  }
}