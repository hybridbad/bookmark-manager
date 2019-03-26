require 'web_helpers.rb'

feature 'add new bookmark to db' do

  scenario 'on index page add link displayed' do
    visit('/')
    click_link "Add new bookmark"
    expect(page).to have_content "Enter url"
  end

  scenario 'get confirmation when bookmark saved' do
    save_bookmark
    expect(page).to have_content('Saved!')
  end

  scenario 'it actually saves the bookmark' do
    save_bookmark
    visit('/bookmarks')
    expect(page).to have_content("http://makers.tech")
  end
end