class Genre

  @@all = []
  attr_reader :name
  def initialize( name )
    self.name = name
  end

  def name=( name )
    if name == ""
      raise "Please include the name of the genre"
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
    Genre.class_variable_get( :@@all ).push( self )
  end

  def self.create( name )
    genre = Genre.new( name )
    genre.save
    genre
  end
end
