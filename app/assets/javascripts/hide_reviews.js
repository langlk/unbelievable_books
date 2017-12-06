$(function() {
  $('#hide_reviews').click(function(event) {
    event.preventDefault();
    $(this).hide();
    $('#reviews-container').hide();
    $('#show_reviews').show();
  });

  $('#show_reviews').click(function(event) {
    event.preventDefault();
    $(this).hide();
    $('#reviews-container').show();
    $('#hide_reviews').show();
  });
});
