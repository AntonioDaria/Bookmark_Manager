require 'pg'
require_relative 'bookmark'

class Bookmarks

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_bookmark_manager')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url']) }
  end

  def self.create(title:, url:)
    return false unless is_url?(url)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_bookmark_manager')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}')")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
