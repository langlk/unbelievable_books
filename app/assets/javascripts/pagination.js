$(document).ready(function() {
  $('.pagination > a').attr('data-remote', 'true');
});

$(document).on('turbolinks:load', function() {
  $('.pagination > a').attr('data-remote', 'true');
});
