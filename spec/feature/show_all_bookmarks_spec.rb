feature 'displays all bookmarks' do

  scenario 'on loading bookmark route display all bookmarks' do
    Bookmarks.add('http://www.makersacademy.com')
    Bookmarks.add('http://www.destroyallsoftware.com')
    Bookmarks.add('http://www.google.com')

    visit('/bookmarks')
  
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
