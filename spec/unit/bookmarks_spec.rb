require 'bookmarks'

describe Bookmarks do
  #let(:bookmarks) { described_class.new }
  context 'show_bookmarks' do
    describe '#show_bookmarks' do
      it 'should show list of saved bookmarks' do
        bookmarks = Bookmarks.all
        expect(bookmarks).to eq ['https://www.amazon.com/', 'https://www.ebay.co.uk/', 'https://www.sportsdirect.com/']
      end
    end

  end
end
