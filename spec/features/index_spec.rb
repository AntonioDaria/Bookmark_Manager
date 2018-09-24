feature "shows index page" do
  scenario "test page is there" do
    visit("/")
    expect(page).to have_content('Bookmarks')
  end
end
