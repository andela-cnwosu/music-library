class Artist

  extend Concerns::Findable
  
  @@all = []
  attr_reader :name
  attr_accessor :songs, :inst_genres

  def initialize( name )
    self.name = name
    @songs = []
    @inst_genres = Set.new
  end
  # set the name of the artistes
  def name=( name )
    if name === ""
      raise "Please include the name of the song"
    end
    @name = name
  end

  # retrieve the list of artistes
  def self.all
    @@all
  end

  # empty the list of artistes
  def self.destroy_all
    @@all = []
  end

  # save an artist in the list of artistes
  def save
    Artist.all.push( self ) if !Artist.all.include?(self)
  end

  def self.create( name )
    artist = Artist.new( name )
    artist.save
    artist
  end

  def genres
    @inst_genres
  end

  # add a song to the artist's songs
  def add_song( song )
    unless self.songs.include?(song)
      @songs << song
      self.genres.add(song.genre)
      song.artist = self
    end
  end
end

