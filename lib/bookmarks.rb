require_relative 'db_connection'
require_relative './comment'
require 'uri'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(
      id: result[0]['id'], 
      title: result[0]['title'], 
      url: result[0]['url']
    )
  end

  def self.display_all
    # call class method query to connect and execute sql query
    bookmarks = DatabaseConnection.query("SELECT * FROM bookmarks")
    # create bookmark instance for every row in the table
    bookmarks.map do |bookmark|
      Bookmark.new(
        id: bookmark['id'], 
        title: bookmark['title'], 
        url: bookmark['url']
      )
    end
  end

  def self.add(url:, title:)
    return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
    Bookmark.new(
      id: result[0]['id'], 
      title: result[0]['title'], 
      url: result[0]['url']
    )
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  def self.update(id:, title:, url:)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}' RETURNING id, url, title;")
    Bookmark.new(
      id: result[0]['id'], 
      title: result[0]['title'], 
      url: result[0]['url']
    )
  end

  def comments(comment_class = Comment)
    comment_class.where(bookmark_id: id)
  end

  private
  
  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
