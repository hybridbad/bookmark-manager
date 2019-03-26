require 'pg'

class Bookmarks

  def self.display_all
    conn = PG.connect(dbname: 'bookmark_manager')
    conn.exec("SELECT * FROM bookmarks") do |result|
      result.map do |row|
        row["url"]
      end
    end
  end

end
