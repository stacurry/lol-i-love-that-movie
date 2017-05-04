get '/' do
  erb :index
end

post '/' do
  quote_string = URI.encode(params[:quote])
  query_string = "http://www.imdb.com/search/text?realm=title&field=quotes&q='#{quote_string}'"

  MovieQuoteParser.get_movie_quote_page_url(query_string)
end
