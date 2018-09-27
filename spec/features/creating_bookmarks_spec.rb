feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('title', with: 'This is a test bookmark')
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')

    expect(page).to have_link('This is a test bookmark', href: 'http://testbookmark.com')
  end

  scenario 'A user add an invalid url' do
    visit('/bookmarks/new')
    fill_in('title', with: 'this is wrong')
    fill_in('url', with: 'wrong url')
    click_button('Submit')

    expect(page).not_to have_content 'this is wrong'
    expect(page).to have_content 'You must submit a valid url'
  end
end
