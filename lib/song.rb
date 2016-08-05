class Song

  extend Concerns::Findable

  @@all = []

  attr_reader :name, :artist, :genre
  def initialize( name, artist = nil , genre = nil )
    self.name = name
    @genre = genre if genre.instance_of? (Genre)
    @artist = artist if artist.instance_of? (Artist)
    self.genre = genre
    self.artist = artist
  end

  # set the name of the song
  def name=( name )
    if name == ""
      raise "Please include the name of the song"
    end
    @name = name
  end

  # set the artist of the song and add song to the list of artist songs
  def artist=( artist )
    # unless artist.instance_of? (Artist)
    #   raise "This is not an artist type"
    # end
    if artist.instance_of? (Artist)
      artist.add_song( self )
      @artist = artist
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
    Song.all.push( self ) if !Song.all.include?(self)
  end

  def self.create( name, artist = nil, genre = nil )
    song = Song.new( name, artist, genre )
    song.save
    song
  end

  def self.new_from_filename(filename)
    name, artist, genre = split_filename(filename)
    new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    name, artist, genre = split_filename(filename)
    create(name, artist, genre)
  end

  def self.split_filename(filename)
    split_file = filename.split(" - ")
    song_artist = Artist.find_or_create_by_name(split_file[0]) 
    song_genre = Genre.find_or_create_by_name(split_file[2].gsub('.mp3', ''))
    artist=(song_artist)
    genre=(song_genre)
    return [split_file[1], artist, genre]
  end

end
