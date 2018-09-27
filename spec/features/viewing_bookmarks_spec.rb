require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    # connection = PG.connect(dbname: 'test_bookmark_manager')

    # Add the test data
    # connection.exec("INSERT INTO bookmarks (url) VALUES ('https://diode.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.sportsdirect.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.ebay.co.uk');")
    Bookmarks.create(title: 'Makers Academy', url: "https://www.makersacademy.com")
    Bookmarks.create(title: 'Destroy all software', url: "https://www.destroyallsoftware.com")
    Bookmarks.create(title: 'Google', url: "https://www.google.com")

    visit('/')

    expect(page).to have_link('Makers Academy', href: 'https://www.makersacademy.com')
    expect(page).to have_link('Destroy all software', href: 'https://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'https://www.google.com')
  end
end
