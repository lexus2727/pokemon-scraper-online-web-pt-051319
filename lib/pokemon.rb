class Pokemon
  
  attr_accessor :name, :type, :db, :id, :hp
  @@all = []
  
  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
    
 end
 
 def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
 end
 
 def self.find(id, db)
   pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
   
  name = pokemon[1]
  type = pokemon[2]
  hp = pokemon[3]
  
  new_pokemon = Pokemon.new(id: id, name: name, type: type, hp: hp, db: db)
 end
     def alter_hp(num, db)
       db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", num, @id)
       
     end
   end
     
   
