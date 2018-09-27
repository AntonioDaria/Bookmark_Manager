require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new(1, "title", "url") }
  describe 'intialize' do
    it 'should have an id' do
      expect(subject.id).to eq 1
    end

    it 'should have a title' do
      expect(subject.title).to eq "title"
    end

    it 'should have a url' do
      expect(subject.url).to eq "url"
    end
  end

end
