require 'dotenv'
Dotenv.load
require 'pg'

class Bookmarks

  def self.display_all(dbname = ENV['REAL_DB'])
    conn = PG.connect(dbname: dbname)
    conn.exec("SELECT * FROM bookmarks") do |result|
      result.map do |row|
        row["url"]
      end
    end
  end

end
