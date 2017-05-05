$(document).ready(function() {
  $(".movie-quote-form").on("submit", function(event) {
    event.preventDefault();

    var $movieQuoteForm = $(this)

    $.ajax({
      method: $movieQuoteForm.attr("method"),
      url: $movieQuoteForm.attr("action"),
      data: $movieQuoteForm.serialize()
    }).done(function(response) {
      $(".quote-container").append(response);
      $(".movie-quote-form").hide();
      $(".search-again-button").show();
    });
  });
});
