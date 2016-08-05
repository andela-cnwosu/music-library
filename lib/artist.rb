class Artist

  @@all = []
  attr_reader :name
  def initialize( name )
    self.name = name
  end

  def name=( name )
    if name == ""
      raise "Please include the name of the artist"
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
    Artist.class_variable_get( :@@all ).push( self )
  end

  def self.create( name )
    artist = Artist.new( name )
    artist.save
    artist
  end
end
