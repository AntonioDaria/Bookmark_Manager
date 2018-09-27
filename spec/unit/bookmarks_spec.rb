require 'bookmarks'

describe Bookmarks do
  # let(:bookmarks) { described_class.new }
  context 'show_bookmarks' do
    describe '.all' do
      it 'should show list of saved bookmarks' do
        connection = PG.connect(dbname: 'test_bookmark_manager')

        # Add the test metadata
        connection.exec("INSERT INTO bookmarks (title, url) VALUES ('MakersAcademy', 'https://diode.makersacademy.com');")
        connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Sportsdirect', 'https://www.sportsdirect.com');")
        connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Ebay', 'https://www.ebay.co.uk');")

        bookmarks = Bookmarks.all
        bookmark = bookmarks.first

        expect(bookmarks.length).to eq 3
        expect(bookmark).to be_a Bookmark
        expect(bookmark).to respond_to(:id)
        expect(bookmark.title).to eq "MakersAcademy"
        expect(bookmark.url).to eq "https://diode.makersacademy.com"
      end
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmarks.create(title: 'Test Bookmark', url: 'http://www.testbookmark.com')
  
      bookmark = Bookmarks.all.first
      expect(bookmark).to be_a Bookmark
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
  
    end

    it 'does not create a new bookmark if the URL is not valid' do
      Bookmarks.create(title: 'This is not real', url: 'not a real bookmark')
      expect(Bookmarks.all).not_to include 'not a real bookmark'
    end
  end
end
