feature 'displays all bookmarks' do
  scenario 'on loading bookmark route display all bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content [
      "http://www.makersacademy.com",
      "http://www.destroyallsoftware.com",
      "http://www.google.com"
     ]
  end
end
