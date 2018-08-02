feature 'Add bookmarks' do
  scenario 'user can add bookmark' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    click_button('Submit')
    expect(page).to have_content 'http://www.testbookmark.com'
  end

  scenario "Bookmark must have valid URL" do
    visit('/bookmarks/new')
    fill_in('url', with: 'bullshit link')
    click_button('Submit')

    expect(page).not_to have_content "bullshit link"
    expect(page).to have_content "Please submit a valid URL"
  end
end
