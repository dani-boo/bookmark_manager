require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'shows all bookmarks in an array' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      expect(Bookmark.all).to include('http://makersacademy.com')
      expect(Bookmark.all).to include('http://destroyallsoftware.com')
      expect(Bookmark.all).to include('http://google.com')

      expected_bookmarks = [
        'http://makersacademy.com',
        'http://google.com',
        'http://destroyallsoftware.com'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end
end