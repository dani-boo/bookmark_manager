require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(url: "http://makersacademy.com")
    Bookmark.create(url: "http://destroyallsoftware.com")
    Bookmark.create(url: "http://google.com")

    visit('/bookmarks')

    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://destroyallsoftware.com"
    expect(page).to have_content "http://google.com"
  end
end
