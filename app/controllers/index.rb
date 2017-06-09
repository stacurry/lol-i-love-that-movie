get '/' do
  erb :index
end

get '/quotes' do
  quote = URI.encode(params[:quote])
  if ( @quotes = MovieQuoteParser.quotes(quote))
    @title = MovieQuoteParser.title(quote)
    erb :_quote_display, layout: false
  else
    @errors = ["This is the worst! We couldn't find that quote.", "Try searching for another one."]
    erb :_errors, layout: false
  end
end
