require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'shows all bookmarks in an array' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark_1 = Bookmark.create(url: "http://makersacademy.com", title: "Makers Academy")
      bookmark_2 = Bookmark.create(url: "http://destroyallsoftware.com", title: "Destroy All Software")
      bookmark_3 = Bookmark.create(url: "http://google.com", title: "Google")

      expected_bookmarks = [
        bookmark_1,
        bookmark_2,
        bookmark_3
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com')

      expect(Bookmark.all).to include bookmark
    end

    # it 'doesn\'t create a bookmark if URL is invalid' do
    #   fakebookmark = Bookmark.create(url: 'bullshit')

    #   expect(Bookmark.all).not_to include(fakebookmark)
    # end
  end

  describe '#==' do
    it 'matches 2 bookmarks if their IDs are identical' do
      bookmark_1 = Bookmark.new(1, 'http://www.testbookmark.com', 'moo')
      bookmark_2 = Bookmark.new(1, 'http://www.testbookmark.com', 'boo')

      expect(bookmark_1).to eq bookmark_2
    end
  end
end
