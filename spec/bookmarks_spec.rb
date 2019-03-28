require 'bookmarks'
require 'web_helpers'

describe Bookmark do

  describe '#display_list' do
    it 'returns a list of bookmarks' do
  
      connection = PG.connect(dbname: 'bookmark_manager_test')

   # Add the test data
      bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.add(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.add(url: "http://www.google.com", title: "Google")

  
      bookmarks = Bookmark.display_all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#add bookmark url and title' do
    it 'adds a bookmark to the database with a title and url' do

      bookmark = Bookmark.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'

    end
  end

  describe '#delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark')

      Bookmark.delete(id: bookmark.id)
      
      bookmarks = Bookmark.display_all

      expect(bookmarks.length).to eq 0
    end
  end

  # describe '#update' do
  #   it 'updates a bookmark title' do
  #     bookmark = Bookmark.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
  #     p bookmark.id
  #     Bookmark.update(id: bookmark.id, title: 'New title')
  #     p bookmark.id
  #     expect(bookmark.title).to eq 'New title'

  #   end
  # end


  # .fin method 
end
