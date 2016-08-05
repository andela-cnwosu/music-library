class Song

  include Concerns::Findable

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
    Song.all.push( self )
  end

  def self.create( name )
    song = Song.new( name )
    song.save
    song
  end

end
