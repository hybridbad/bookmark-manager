require 'web_helpers'

feature 'delete a bookmark!' do

  scenario '#visit bookmarks page and delete a bookmark from the list' do
    add_bookmark_entries

    visit('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    
    expect(page).not_to have_link('Makers', href: 'http://www.makersacademy.com')
    
  end

end