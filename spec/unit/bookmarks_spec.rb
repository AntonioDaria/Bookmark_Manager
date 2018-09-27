require 'bookmarks'

describe Bookmarks do
  #let(:bookmarks) { described_class.new }
  context 'show_bookmarks' do
    describe '.all' do
      it 'should show list of saved bookmarks' do
        connection = PG.connect(dbname: 'test_bookmark_manager')

        # Add the test metadata
        connection.exec("INSERT INTO bookmarks (url) VALUES ('https://diode.makersacademy.com');")
        connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.sportsdirect.com');")
        connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.ebay.co.uk');")

        bookmarks = Bookmarks.all

        expect(bookmarks).to include('https://diode.makersacademy.com')
        expect(bookmarks).to include('https://www.sportsdirect.com')
        expect(bookmarks).to include('https://www.ebay.co.uk')
      end
    end
  end

  describe '.create' do
  it 'creates a new bookmark' do
    Bookmarks.create(title: 'Test Bookmark', url: 'http://www.testbookmark.com')

    expect(Bookmarks.all).to include 'http://www.testbookmark.com'
  end

  it 'does not create a new bookmark if the URL is not valid' do
   Bookmarks.create(title: 'This is not real',url: 'not a real bookmark')
   expect(Bookmarks.all).not_to include 'not a real bookmark'
 end
end
end
