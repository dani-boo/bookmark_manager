require 'bookmark'
describe Bookmark do
  describe '#all' do
    it 'shows all bookmarks' do
      expect(Bookmark.all).to include('http://makersacademy.com')
      expect(Bookmark.all).to include('http://google.com')
      expect(Bookmark.all).to include('http://destroyallsoftware.com')
    end
  end
end
