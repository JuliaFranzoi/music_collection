require('pry')
require_relative('artist')
require_relative('record')



artist1 = Artist.new({'name'=>'Regina Spector'})
artist1.save()



record1 = Records.new({
  'title' => 'pepperoni',
  'artist_id' => artist1.id
  })

record1.save()
Records.all()
record1.artist()
ar = artist1.records()
puts ar
# binding.pry
nil