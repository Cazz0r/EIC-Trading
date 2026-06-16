page.tradeEvents = {
  createTradeEventForOrder: function() {
    if(!page.debounceRequest()) return;
    var content = $('#trade_event_input').val();
    if(blank(content)) { page.finishRequest(); return; }

    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/trade_events',
      type: 'POST',
      data: {'trade_event[content]': content, 'trade_event[order_id]': page.getId()},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        setTimeout(function(){ location.reload(); }, 200);
      },
      error: function(response) {
        HideLoading();
        page.finishRequest();
        page.errors.set(response.responseJSON);
      }
    });
  },
  createTradeEvent: function() {
    if(!page.debounceRequest()) return;
    var content = $('#trade_event_input').val();
    if(blank(content)) { page.finishRequest(); return; }

    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/trade_events',
      type: 'POST',
      data: {'trade_event[content]': content, 'trade_event[account_id]': page.getId()},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        setTimeout(function(){ location.reload(); }, 200);
      },
      error: function(response) {
        HideLoading();
        page.finishRequest();
        page.errors.set(response.responseJSON);
      }
    });
  },
  updateTradeEvent: function(id) {
    if(!page.debounceRequest()) return;
    var content = $('#trade_event_input_' + id).val();
    if(blank(content)) { page.finishRequest(); return; }

    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/trade_events/' + id,
      type: 'PUT',
      data: {'trade_event[content]': content},
      traditional: true,
      dataType: 'json',
      success: function(response) {
        HideLoading();
        setTimeout(function(){ location.reload(); }, 200);
      },
      error: function(response) {
        HideLoading();
        page.finishRequest();
        page.errors.set(response.responseJSON);
      }
    });
  },
  deleteTradeEvent: function(id) {
    if(!page.debounceRequest()) return;
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
        setTimeout(function(){ location.reload(); }, 200);
      },
      error: function(response) {
        HideLoading();
        page.finishRequest();
        page.errors.set(response.responseJSON);
      }
    });
  }
}