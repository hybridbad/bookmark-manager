require 'web_helpers'

feature 'delete a bookmark!' do

  scenario '#visit bookmarks page and delete a bookmark from the list' do
    add_bookmark_entries

    visit('/bookmarks')
    fill_in('delete_bookmark', with: 'Makers')
    save_and_open_page
    click_button('Delete')
    
    expect(page).to have_no_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
    
  end

end