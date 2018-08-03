feature 'Add bookmarks' do
  scenario 'user can add bookmark' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'test link')
    click_button('Submit')
    expect(page).to have_content 'test link'
  end

  scenario "Bookmark must have valid URL" do
    visit('/bookmarks/new')
    fill_in('url', with: 'you\'re not even trying!')
    fill_in('title', with: 'bullshit link')
    click_button('Submit')

    expect(page).not_to have_content "bullshit link"
    expect(page).to have_content "Please submit a valid URL"
  end
end
