def save_bookmark
  visit('/bookmarks/add')
  fill_in('url_text', :with => 'http://makers.tech')
  click_button('Save')
end