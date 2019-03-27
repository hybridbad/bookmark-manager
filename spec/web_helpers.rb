def save_bookmark
  visit('/bookmarks/add')
  fill_in('url_text', :with => 'http://makers.tech')
  click_button('Save')
end

def add_bookmark_entries
  Bookmarks.add(url: 'http://www.makersacademy.com')
  Bookmarks.add(url: 'http://www.destroyallsoftware.com')
  Bookmarks.add(url: 'http://www.google.com')
end