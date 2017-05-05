get '/' do
  erb :index
end

post '/' do
  quote = URI.encode(params[:quote])
  quote_search_url = "http://www.imdb.com/search/text?realm=title&field=quotes&q=#{quote}"
  movie_quote_page_url = MovieQuoteParser.movie_quote_page(quote_search_url)
  @quotes = MovieQuoteParser.parse_quote_data(movie_quote_page_url)[0..9]
  @title = MovieQuoteParser.movie_title(quote_search_url)
  erb :_quote_display, layout: false, locals: { quotes: @quotes }
end
