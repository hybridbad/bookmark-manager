def save_bookmark
  visit('/bookmarks/add')
  fill_in('url_text', :with => 'http://makers.tech')
  click_button('Save')
end

def add_bookmark_entries
  Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers')
  Bookmark.add(url: 'http://www.destroyallsoftware.com', title: 'Destroy Software')
  Bookmark.add(url: 'http://www.google.com', title: 'Google')
end

# def persisted_data(id:)
#   connection = PG.connect(dbname: 'bookmark_manager_test')
#   result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
#   result.first
# end