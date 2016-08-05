class MusicLibraryController

	attr_accessor :path, :command
	
	def initialize(path = './db/mp3s')
		@path = path
		@music_importer = MusicImporter.new(path)
		@music_importer.import
	end

	def call
		puts "Hi #{ENV['USER']}, I am your music buddy. What would you like me to do for you?",
			"Type 'help' to view commands" if @command === nil
		@command = nil
		while @command != "exit"
			@command = gets.chomp.downcase
			get_input(@command)
			if @command != "exit"
				puts "\nWhat else would you like me to do for you? Type 'help' to view commands"
			end
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
		  		play_song
		  	when "list artist"
		  		list_artist
		 	when "list genre"
		 		list_genre 
		 	when "help"
			 	get_help
		 	when "exit"
			 	puts "Have a nice day!"
			else
			  	puts "Please enter a valid command"
		end
	end

	def list_songs
		song_list = @music_importer.files.map.with_index(1) do |file, index|
			"#{index}. #{file}"
		end
		show_results(song_list)
	end

	def list_artists
		artist_list = Artist.all.map do |artist|
			artist.name
		end
		show_results(artist_list)
	end

	def list_genres
		genre_list = Genre.all.map do |genre|
			genre.name
		end
		show_results(genre_list)
	end

	def play_song
		if @music_importer.files.empty?
  			raise "There are currently no songs in your library"
  		end
  		puts "What is the track number of the song?"
  		track = gets.to_i
	  	if @music_importer.files.size < track
			puts "Please enter a valid track number"
			#jhfhhffffff
			play_song(gets.to_i)
		end
		puts "Playing #{@music_importer.files[track - 1]}"
	end

	def list_artist
		puts "What is the name of the artist?"
		name = gets.chomp.downcase
	 	artist_list = @music_importer.files.select do |file|
			Song.split_filename(file.downcase)[1] === name
		end
		show_results(artist_list)
	end

	def list_genre
		puts "What type of genre?"
		name = gets.chomp.downcase
		genre_list = @music_importer.files.select do |file|
			Song.split_filename(file.downcase)[2] === name
		end
		show_results(genre_list)
	end

	def get_help
		puts "-" * 70,
			"list songs\tList all songs in your music library",
			"list artists\tList all artist names in your music library",
			"list genres\tList all song genres in your music library",
			"play song\tPlay a song in your music library",
			"list artist\tList all songs by an artist in your music library",
			"list genre\tList all songs in a genre in your music library",
			"exit\t\tSay GoodBye",
			"-" * 70
	end

	def show_results(result_list)
		return puts "No results found." if result_list.empty? 
		puts "-" * 70, result_list, "-" * 70

	end
end