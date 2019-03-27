require 'bookmarks'

describe Bookmarks do

  describe '#display_list' do
    it 'returns a list of bookmarks' do
  
      # Add the test data
      Bookmarks.add(url: 'http://www.makersacademy.com')
      Bookmarks.add(url: 'http://www.destroyallsoftware.com')
      Bookmarks.add(url: 'http://www.google.com')
  
      bookmarks = Bookmarks.display_all
  
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '#add bookmark url and title' do
    it 'adds a bookmark to the database with a title and url' do

      Bookmarks.add(url: 'http://makers.tech')
      bookmarks = Bookmarks.display_all
      expect(bookmarks).to include('http://makers.tech')
    end
  end


end
