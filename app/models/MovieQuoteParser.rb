module MovieQuoteParser
  def self.movie_quote_page(url)
    quote_search_results = Nokogiri::HTML(open(url))
    movie_show_page_link = quote_search_results.css(".title").children[0]

    if movie_show_page_link
      movie_show_page_url = movie_show_page_link.attr("href")
      "http://www.imdb.com/#{movie_show_page_url}trivia?tab=qt"
    else
      nil
    end
  end

  def self.movie_title(url)
    quote_search_results = Nokogiri::HTML(open(url))
    movie_title = quote_search_results.css(".title").children[0].text
  end

  def self.parse_quote_data(url)
    if url
      data = Nokogiri::HTML(open(url))
      quote_data = data.css(".sodatext")

      quote_content_array = []
      quote_data.each do |quote|
        quote_content_array << quote.children.text.split("\n").reject { |i| i == "" }
      end
      quote_content_array
    end
  end
end

