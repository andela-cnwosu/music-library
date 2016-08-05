class Song

  extend Concerns::Findable

  @@all = []
  attr_reader :name, :artist, :genre

  def initialize( name, artist = nil , genre = nil )
    @genre = genre if genre.instance_of? (Genre)
    self.name = name
    self.artist = artist
    self.genre = genre
  end

  # set the name of the song
  def name=( name )
    raise "Please include the name of the song" if name === ""
    @name = name
  end

  # set the artist of the song and add song to the list of artist songs
  def artist=( artist )
    if artist.instance_of? (Artist)
      @artist = artist
      artist.add_song( self )
    end
  end

  # set the genre of the song and add song to the list of genre songs
  def genre=( genre )
    if genre.instance_of? (Genre)
      @genre = genre
      unless genre.songs.include?( self )
        genre.songs << self
        genre.inst_artists.add(self.artist)
      end
    end
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
    @@all << self if !@@all.include?(self)
  end

  def self.create( name, artist = nil, genre = nil )
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  # instantiate song from filename
  def self.new_from_filename(filename)
    name, artist, genre = format_song_params(filename)
    new(name, artist, genre)
  end

  # save song from filename
  def self.create_from_filename(filename)
    name, artist, genre = format_song_params(filename)
    create(name, artist, genre)
  end

  # find artist and genre models by name and return array
  def self.format_song_params(filename)
    name, artist, genre = self.split_filename(filename)
    artist=(Artist.find_or_create_by_name(artist))
    genre=(Genre.find_or_create_by_name(genre))
    return [name, artist, genre]
  end

  # split file name by delimiter
  def self.split_filename(filename)
    split_name = filename.gsub('.mp3', '').split(" - ")
    return [split_name[1], split_name[0], split_name[2]]
  end

end
