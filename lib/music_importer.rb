class MusicImporter
  attr_reader :path

  def initialize(path)
    self.path = path
  end

  def path=(path)
    raise "Please include a valid path of the mp3 files" unless Dir.exist? path
    @path = path
  end

  def files
    Dir.entries(@path)[2..-1]
  end

  def import
    files.each { |file| Song.create_from_filename file }
  end
end