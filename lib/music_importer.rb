class MusicImporter

	attr_reader :path
	attr_accessor :files
	
	def initialize(path)
		@files = []
		self.path = path
	end

	def path=(path="")
		if !Dir.exist?(path)
	    	raise "Please include a valid path of the mp3 files"
	    end
	    @path = path
		Dir.foreach(path) do |file|
			if file[0] != '.' && file.end_with?("mp3")
			  @files << file
			end
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