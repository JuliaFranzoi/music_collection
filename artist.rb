require('pg')

class Artist
  attr_reader :name, :id

  def initialize(options)
    @name = options['name']
    @id = options[id].to_i
  end  

  
  def save()
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "INSERT INTO artists (name) VALUES ('#{@name}'RETURNING *;"
    result = db.exec(sql)
    @id = result[0]['id'].to_i
    db.close()
  end 
end
   
end