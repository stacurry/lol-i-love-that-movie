get '/' do
  erb :index
end

post '/' do
  quote = URI.encode(params[:quote])
  quote_search_url = "http://www.imdb.com/search/text?realm=title&field=quotes&q=#{quote}"
  movie_quote_page_url = MovieQuoteParser.movie_quote_page(quote_search_url)
  if movie_quote_page_url
    @quotes = MovieQuoteParser.parse_quote_data(movie_quote_page_url)
    @title = MovieQuoteParser.movie_title(quote_search_url)
    erb :_quote_display, layout: false, locals: { quotes: @quotes }
  else
    @errors = ["This is the worst! We couldn't find that quote.", "Try searching for another one."]
    erb :_errors, layout: false
  end
end
