require 'dotenv'
Dotenv.load
require 'pg'

class Bookmarks

  def self.display_all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    conn.exec("SELECT * FROM bookmarks") do |result|
      result.map do |row|
        row["url"]
      end
    end
  end

end
