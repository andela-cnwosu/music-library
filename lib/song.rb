class Song
  include Concerns
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil , genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def artist=(artist)
    @artist = artist
    artist.add_song self
  end

  def genre=(genre)
    @genre = genre
    add_genre_to_artist if @artist
    add_song_to_genre
    add_artist_to_genre
  end

  def add_genre_to_artist
    artist.add_genre genre
  end

  def add_song_to_genre
    genre.add_song self
  end

  def add_artist_to_genre
    genre.add_artist artist
  end

  def self.new_from_filename(filename)
    formatted_params = format_song_params filename
    new(formatted_params[0], formatted_params[1], formatted_params[2])
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
end
