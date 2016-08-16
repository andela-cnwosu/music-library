class Genre
  include Concerns
  @@all = []
  attr_accessor :songs, :name

  def initialize(name)
    @name = name
    @songs = []
    @@artists = Set.new
  end

  def artists
    @@artists
  end

  def add_song(song)
    @songs << song unless songs.include? song
  end

  def add_artist(artist)
    artists.add artist
  end
end
