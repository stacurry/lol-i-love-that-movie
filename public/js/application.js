$(document).ready(function() {
  $(".movie-quote-form").on("submit", function(event) {
    event.preventDefault();

    var movieQuote = $(this).serialize();

    $.ajax({
      method: "post",
      url: "/",
      data: movieQuote
    }).done(function(response) {
      $(".quote-container").append(response);
      $(".movie-quote-form").hide();
      $(".search-again-button").show();
    });
  });








});
