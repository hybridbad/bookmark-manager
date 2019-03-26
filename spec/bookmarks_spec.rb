require 'bookmarks'

describe Bookmarks do

  describe '#display_list' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
  
      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
  
      bookmarks = Bookmarks.display_all
  
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '#add bookmark' do
    it 'adds a bookmark to the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmarks.add('http://makers.tech')
      bookmarks = Bookmarks.display_all
      expect(bookmarks).to include('http://makers.tech')
    end
  end

end
