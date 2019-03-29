require 'pg'

class DatabaseConnection
  # creates connection to db and sets as class instance variable
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end