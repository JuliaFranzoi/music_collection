require('pg')

class SqlRunner

  def self.run( sql )#it gets a sql string
    
    begin
      db = PG.connect( {dbname: 'record_collection', host: "localhost" })
      result = db.exec( sql)
    ensure
      db.close()
    end  
    return result
  end
end