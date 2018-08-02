feature 'Add bookmarks' do
  scenario 'user can add bookmark' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')
    save_and_open_page
    expect(page).to have_content 'http://testbookmark.com'
  end
end
