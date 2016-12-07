require('pg')
require_relative('db/runner_sql.rb')
class Artist
  attr_reader :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
  end  

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run( sql)
    return artists.map{|artist| Artist.new( artist )}
  end#returns multiple insatnces

  def save()
    db = PG.connect({dbname: 'record_collection', host: 'localhost'})
    sql = "INSERT INTO artists (name) VALUES ('#{@name}')RETURNING *;"
    result = db.exec(sql)
    @id = result[0]['id'].to_i
    db.close()
  end

  # def self.delete_all()  
  #   db = PG.connect ({dbname: 'record_collection', host: 'localhost'})
  #   sql = "DELETE FROM artists;"
  #   orders = db.exec(sql)
  #   db.close()
  # end 
  
  
  def records()
    sql = "SELECT * FROM  records WHERE artist_id = #{ @id };"
    records = SqlRunner.run( sql )
    return records.map { |record| Records.new( record ) }#getting every pizza order as an instance and putting it into an array
  end

end
   
