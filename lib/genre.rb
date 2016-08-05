class Genre

  extend Concerns::Findable
  
  @@all = []
  attr_reader :name
  attr_accessor :songs, :inst_artists
  
  def initialize(name)
    self.name = name
    @songs = []
    @inst_artists = Set.new
  end

  # set the name of the song
  def name=(name)
    raise "Please include the name of the genre" if name === ""
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
    Genre.all << self if !Genre.all.include?(self)
  end

  # return list of artists in genre
  def artists
    @inst_artists
  end

  # create genre by adding to list using #save
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
end
