class MusicImporter

	attr_reader :path
	attr_accessor :files
	
	def initialize(path)
		@files = []
		self.path = path
	end

	def path=(path)
	    raise "Please include the path of the mp3 files" if path == ""
	    @path = path
		Dir.foreach(path) do |file|
		  files.push(file) if file[0] != '.'
		end
  	end

  	def files
  		@files
  	end

  	def import
  		self.files.each do |file|
  			Song.create_from_filename(file)
  		end
  	end
end