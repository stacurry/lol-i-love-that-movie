module MovieQuoteParser
  def self.get_movie_quote_page_url(url)
    quote_search_results = Nokogiri::HTML(open(url))
    movie_show_page = quote_search_results.css(".title").children[0].attr("href")
    "http://www.imdb.com/#{movie_show_page}trivia?tab=qt"
  end
end

