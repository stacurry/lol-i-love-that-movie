get '/' do
  erb :index
end

post '/' do
  quote = URI.encode(params[:quote])
  quote_search_url = "http://www.imdb.com/search/text?realm=title&field=quotes&q=#{quote}"
  movie_quote_page_url = MovieQuoteParser.movie_quote_page(quote_search_url)
  MovieQuoteParser.parse_quote_data(movie_quote_page_url)
  "working"
end
