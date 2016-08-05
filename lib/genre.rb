class Genre

  @@all = []
  
  attr_reader :name
  attr_accessor :songs, :inst_artists
  def initialize( name )
    self.name = name
    @songs = []
    @inst_artists = Set.new
  end

  # set the name of the song
  def name=( name )
    if name == ""
      raise "Please include the name of the genre"
    end
    @name = name
  end

  # retrieve the list of songs
  def self.all
    @@all
  end

  # empty the list of songs
  def self.destroy_all
    @@all = []
  end

  # save a song in the list of songs
  def save
    Genre.all.push( self )
  end

  def artists
    @inst_artists
  end

  def self.create( name )
    genre = Genre.new( name )
    genre.save
    genre
  end
end
