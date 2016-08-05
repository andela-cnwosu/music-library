class MusicLibraryController

	attr_accessor :path
	
	def initialize(path = './db/mp3s')
		@path = path
		@music_importer = MusicImporter.new(path)
		@music_importer.import
	end

	def call
		puts "What would you like to do? Type 'help' to view commands"
		command = nil
		while command != "exit"
			command = gets.chomp.downcase
			get_input(command)
		end	
	end

	def get_input(command)
		case command
			when "list songs"
				list_songs
			when "list artists"
			 	list_artists
			when "list genres"
			  	list_genres
		  	when "play song"
		  		puts "What is the track number of the song?"
			  	play_song(gets.to_i)
		  	when "list artist"
		  		puts "What is the name of the artist?"
			 	list_artist(gets.chomp.downcase)
		 	when "list genre"
			 	list_genre(gets.chomp.downcase)
		 	when "help"
			 	get_help
		 	when "exit"
			 	puts "Have a nice day!"
			else
			  	puts "Please enter a valid command"
		end
	end

	def list_songs
		@music_importer.files.each.with_index(1) do |file, index|
			puts "#{index}. #{file}"
		end
	end

	def list_artists
		Artist.all.each do |artist|
			puts artist.name
		end
	end

	def list_genres
		Genre.all.each do |genre|
			puts genre.name
		end
	end

	def play_song(track)
		puts "Playing #{@music_importer.files[track - 1]}"
	end

	def list_artist(name)
		@music_importer.files.each do |file|
			puts file if Song.split_filename(file.downcase)[1] == name
		end
	end

	def list_genre(name)
		@music_importer.files.each do |file|
			puts file if Song.split_filename(file.downcase)[2] == name
		end
	end

	def get_help
		puts "-" * 70,
		"list songs\tList all songs in your music library",
		"list artists\tList all artist names in your music library",
		"list genres\tList all genres in your music library",
		"play song\tPlay a song in your music library",
		"list artist\tList all songs by an artist in your music library",
		"list genre\tList all songs in a genre in your music library",
		"-" * 70
	end
end