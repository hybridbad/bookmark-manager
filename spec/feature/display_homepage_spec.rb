feature 'Display welcome message on homepage' do
  scenario 'When homepage opened, displays welcome message' do
    visit '/'
    expect(page).to have_content 'Hi there, welcome to Bookmark Manager'
  end
end
