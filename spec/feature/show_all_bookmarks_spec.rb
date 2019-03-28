require './spec/web_helpers'

feature 'displays all bookmarks' do

  scenario 'on loading bookmark route display all bookmarks' do
    add_bookmark_entries

    visit('/bookmarks')

    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
