require 'dotenv'
Dotenv.load
require 'pg'

class Bookmarks

  def self.display_all
    # call connect method
    self.connect_db
    @conn.exec("SELECT * FROM bookmarks") do |result|
      result.map do |row|
        row["url"]
      end
    end
  end

  def self.add(url:)
    self.connect_db
    @conn.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end

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
