feature 'Validate the user input is a URL' do

  scenario 'User puts a bad url in and it flashes an error' do
    visit('/bookmarks/add')
    fill_in('url_text', with: 'Rubbish URL')
    fill_in('title', with: "Test")
    click_button('Save')

    expect(page).not_to have_content "Rubbish URL"
    expect(page).to have_content "You must submit a valid URL."
  end
end