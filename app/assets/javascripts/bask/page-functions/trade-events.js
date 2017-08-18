page.tradeEvents = {
  createTradeEvent: function() {
    var content = $('#trade_event_input').val();
    if(blank(content)) { return; }

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
  }
}