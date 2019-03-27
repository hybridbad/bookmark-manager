require 'web_helpers.rb'

feature 'add new bookmark to db' do

  scenario 'on index page add link displayed' do
    visit('/')
    click_link "Add new bookmark"
    expect(page).to have_content "Enter url"
  end

  scenario 'it actually saves the bookmark' do
    visit('/bookmarks/add')
    fill_in('url_text', with: 'http://makers.tech')
    fill_in('title', with: "Test")
    click_button('Save')
    
    expect(page).to have_content('http://makers.tech')
    expect(page).to have_content('Test')
  end
end