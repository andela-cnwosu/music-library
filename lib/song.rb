class Song

  @@all = []
  attr_reader :name
  def initialize( name )
    self.name = name
  end

  def name=( name )
    if name == ""
      raise "Please include the name of the song"
    end
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    Song.class_variable_get( :@@all ).push( self )
  end

  def self.create( name )
    song = Song.new( name )
    song.save
    song
  end
end
