class MusicImporter
  attr_reader :path

  def initialize(path)
    self.path = path
  end

  def path=(path)
    return Message.invalid_path unless Dir.exist? path
    @path = path
  end

  def files
    Dir.entries(@path)[2..-1]
  end

  def import
    files.each { |file| Song.create_from_filename file }
  end
end