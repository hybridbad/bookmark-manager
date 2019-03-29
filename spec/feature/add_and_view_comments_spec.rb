feature 'adding and viewing comments' do
  scenario 'add comment to a bookmark' do
    bookmark = Bookmark.add(url: 'http://makers.tech', title: 'Makers')

    visit('/bookmarks')
    first('.bookmark').click_button 'Add comment'

    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

    fill_in 'comment', with: 'This is a comment'
    click_button 'Submit'

    expect(current_path).to eq "/bookmarks"
    expect(first('.bookmark')).to have_content 'this is a test comment on a bookmark'
    
  end
end