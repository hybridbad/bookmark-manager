def save_bookmark
  visit('/bookmarks/create')
  fill_in('url_text', :with => 'http://makers.tech')
  click_button('Save')
end