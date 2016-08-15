class Artist
  include Concerns
  @@all = []
  attr_accessor :songs, :name

  def initialize(name)
    @name = name
    @songs = []
    @@genres = Set.new
  end

  def genres
    @@genres
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless songs.include? song
  end

  def add_genre(genre)
    genres.add genre unless genres.include? genre
  end
end

