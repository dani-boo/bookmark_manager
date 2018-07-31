require 'bookmark'
describe Bookmark do
  describe '#all' do
    it 'shows all bookmarks' do
      expect(Bookmark.all).to include('http://www.google.com')
      expect(Bookmark.all).to include('http://www.youtube.com')
    end
  end
end 