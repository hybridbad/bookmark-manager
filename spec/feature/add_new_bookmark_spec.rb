require 'web_helpers.rb'

feature 'add new bookmark to db' do

  scenario 'on index page add link displayed' do
    visit('/')
    click_link "Add new bookmark"
    expect(page).to have_content "Enter url"
  end

  scenario 'it actually saves the bookmark' do
    save_bookmark
    visit('/bookmarks')
    save_and_open_page
    expect(page).to have_content("http://makers.tech")
  end
end