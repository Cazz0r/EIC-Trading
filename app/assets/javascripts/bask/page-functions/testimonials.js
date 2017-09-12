page.testimonials = {
  init: function() {
    // console.log('You are signed in!');
  },
  createTestimonial: function() {
    // Perform error checks
    page.errors.clear();
    if(blank($('#testimonial_content').val())) {
      return page.errors.set(page.errors.custom("If you'd like to leave a testimonial you need to enter some text."));
    }
    if(blank($('#testimonial_account_id').val())) {
      return page.errors.set(page.errors.custom("Please select an account for this testimonial."));
    }
    if(blank($('#testimonial_order_id').val())) {
      return page.errors.set(page.errors.custom("Please select an order for this testimonial."));
    }

    // Once error states pass, send the order to the server
    ShowLoading();
    $.ajax({
      url: '/api/v1/testimonials',
      type: 'POST',
      data: page.testimonials.getTestimonialFromForm(),
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
  deleteTestimonial: function(id) {
    page.errors.clear();
    ShowLoading();
    $.ajax({
      url: '/api/v1/testimonials/' + id,
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
        page.errors.set(response.responseJSON);
      }
    });
  },
  getTestimonialFromForm: function() {
    return {
      'testimonial[content]': $('#testimonial_content').val(),
      'testimonial[account_id]': $('#testimonial_account_id').val(),
      'testimonial[order_id]': $('#testimonial_order_id').val()
    };
  }
}