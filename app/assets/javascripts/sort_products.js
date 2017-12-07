$(document).ready(function() {
  $('#sort-method-button').hide();
  $('#sort_method').change(function() {
    form = $('#sort-form')[0];
    Rails.fire(form, 'submit');
  });
});

$(document).on('turbolinks:load', function() {
  $('#sort-method-button').hide();
  $('#sort_method').change(function() {
    form = $('#sort-form')[0];
    Rails.fire(form, 'submit');
  });
});
