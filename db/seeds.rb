# Tag.create(name: '#one')
# Tag.create(name: '#two')
# Tag.create(name: '#three')
Tag.destroy_all
i=0
["#one", "#two", "#three"].each do |tag|
  t = Tag.new(name: tag)

  ["Hello", "World", "Batman"].each do |note|
    note = note + "#{i+=1}"
    t.notes.build(content: note)
  end

  t.save!
end

