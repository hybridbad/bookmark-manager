feature 'displays all bookmarks' do
  scenario 'on loading bookmark route display all bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content [
      "http://makers.tech",
      "http://www.google.com", 
      "http://www.twitter.com",
      "http://www.pistonheads.com",
      "http://www.bbc.co.uk"
    ]
  end
end
