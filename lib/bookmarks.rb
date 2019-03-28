require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.display_all
    # call connect method
    self.connect_db
    result = @conn.exec("SELECT * FROM bookmarks")
    # create bookmark instance for every row in the table
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.add(url:, title:)
    self.connect_db
    result = @conn.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    self.connect_db
    @conn.exec("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  # def self.update(id:, title:)
  #   self.connect_db
  #   update = @conn.exec("UPDATE bookmarks SET title = '#{title}' WHERE id = '#{id}' RETURNING id, url, title")

  #   p update[0]['title']
  # end

  private

  def self.connect_db
    # helper method to set up connection for other methods
    # set conn var as class variable
    if ENV['ENVIRONMENT'] == 'test'
      @conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      @conn = PG.connect(dbname: 'bookmark_manager')
    end
  end

end
