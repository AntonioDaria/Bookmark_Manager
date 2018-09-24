class Bookmarks
  attr_reader :saved_pages
  def initialize
    @saved_pages = ['https://www.amazon.com/', 'https://www.ebay.co.uk/', 'https://www.sportsdirect.com/']
  end

  def show_bookmarks
    saved_pages
  end
end
