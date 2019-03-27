require './spec/web_helpers'

feature 'displays all bookmarks' do

  scenario 'on loading bookmark route display all bookmarks' do
    add_bookmark_entries

    visit('/bookmarks')
  
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
