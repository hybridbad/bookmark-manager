require 'bookmarks'
require 'web_helpers'

describe Bookmark do

  describe '#display_list' do
    it 'returns a list of bookmarks' do

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

    it 'does not create a new bookmark if the URL is not valid' do
      bookmark = Bookmark.add(url: 'not a real bookmark', title: 'not a real bookmark')
      expect(bookmark).not_to be_a Bookmark
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

  describe '#update' do
    it 'updates a bookmark title' do
      bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')
      
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end

  describe '#find' do
    it 'find bookmark and returns the object' do
      bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#comments' do
    it 'returns a list of comments on the bookmark' do
      bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      DatabaseConnection.query("INSERT INTO comments (id, text, bookmark_id) VALUES(1, 'Test comment', #{bookmark.id})")

      comment = bookmark.comments.first
      
      expect(comment['text']).to eq 'Test comment'
    end
  end

end
