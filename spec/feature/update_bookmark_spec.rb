require 'web_helpers'

feature 'update a bookmark!' do

  scenario '#visit bookmarks page and update a bookmark from the list' do
    bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers')

    visit('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Update'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"

    fill_in('update_title', with: 'Makers Academy')
    fill_in('update_url', with: 'https://makers.tech/')

    click_button('Submit')
    save_and_open_page

    expect(current_path).to eq '/bookmarks'    
    expect(page).not_to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Makers Academy', href: 'https://makers.tech/')
    
  end

end