module Concerns::Findable
	
    def find_by_name(name)
	    all.each do |song|
	      	if song.name == name
	        	return song
	      	end
	    end
  	end

  	def find_or_create_by_name(name)
	    search_song = all.select do |song|
	      	song.name == name
	    end
	    Song.new(name) if !search_song 
  	end
end