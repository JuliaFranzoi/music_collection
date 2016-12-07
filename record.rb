require('pg')

class Records
  attr_reader :title, :id

  def initialize(options)
    @title = options['title']
    @id = options['id'].to_i
    @artist_id = options['artist_id']
  end

  def self.all()
    sql = "SELECT * FROM records"
    records = SqlRunner.run( sql)
    return records.map{|record| Records.new( record )}
  end#returns multiple insatnces  

  
  def save()
    db = PG.connect({dbname: 'record_collection', host: 'localhost'})
    sql = "INSERT INTO records (title, artist_id) VALUES ('#{@title}', '#{@artist_id}') RETURNING *;"
    result = db.exec(sql)
    @id = result[0]['id'].to_i
    db.close()
  end 
  
  


 def artist()
   sql = "SELECT * FROM artists WHERE id = #{ @artist_id };"
   artist = SqlRunner.run( sql )[0]
   return Artist.new (artist)
 end
  # def self.delete_all()  
  #   db = PG.connect ({dbname: 'record_collection', host: 'localhost'})
  #   sql = "DELETE FROM records;"
  #   orders = db.exec(sql)
  #   db.close()
  # end 

end
   