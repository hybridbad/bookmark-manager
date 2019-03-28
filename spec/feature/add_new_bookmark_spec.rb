require 'web_helpers.rb'

feature 'add new bookmark to db' do

  scenario 'it actually saves the bookmark' do
    visit('/bookmarks/add')
    fill_in('url_text', with: 'http://makers.tech')
    fill_in('title', with: "Test")
    click_button('Save')

    expect(page).to have_link('Test', href: 'http://makers.tech')
 
  end
end