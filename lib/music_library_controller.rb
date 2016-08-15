class MusicLibraryController
  extend Concerns::Helper
  attr_accessor :path, :command

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    begin
      get_input
    rescue Interrupt
      process_command "exit"
    end
  end

  def get_input
    begin_message
    @command = nil
    while @command != "exit"
      @command = gets.chomp.downcase
      process_command @command
    end
  end

  def begin_message
    if @command.nil?
      message = "Hi #{ENV['USER']}, I am your music buddy."\
        "What would you like me to do for you?\n"\
        "Type 'help' to view commands"
      format_message message
    end
  end

  def format_message(message)
    puts "-" * 75, message, "-" * 75
  end

  def process_command(command)
    return "There are currently no songs in your library" if Song.all.empty?
    unless MusicLibraryController.method_defined? command.tr(' ', '_')
      puts "Invalid command"
      return continue_message
    end
    send command.tr(' ', '_')
  end

  def list_songs
    song_list = Song.all.map.with_index(1) do |song, index|
      "#{index}. #{format_song(song)}"
    end
    show_results song_list
  end

  def list_artists
    artist_list = Artist.all.map do |artist|
      artist.name
    end
    show_results artist_list
  end

  def list_genres
    genre_list = Genre.all.map do |genre|
      genre.name
    end
    show_results genre_list
  end

  def play_song
    puts "What is the track number of the song?"
    track = get_track
    puts "Playing #{track}"
    continue_message
  end

  def get_track
    track = Integer(gets.chomp) rescue nil
    while track.nil? || Song.all.size < track || track < 1
      puts "Please enter a valid track number"
      track = Integer(gets.chomp) rescue nil
    end
    format_song Song.all[track - 1]
  end

  def format_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "What is the name of the artist?"
    name = gets.chomp
    get_songs_by_type(Artist, name)
  end

  def list_genre
    puts "What type of genre?"
    name = gets.chomp
    get_songs_by_type(Genre, name)
  end

  def get_songs_by_type(type, name)
    genre = type.find_by_name(name)
    song_list = genre.songs.map { |song| format_song song } unless genre.nil?
    show_results song_list || []
  end

  def help
    message = "list songs\tList all songs in your music library",
      "list artists\tList all artist names in your music library",
      "list genres\tList all song genres in your music library",
      "play song\tPlay a song in your music library",
      "list artist\tList all songs by an artist in your music library",
      "list genre\tList all songs in a genre in your music library",
      "exit\t\tSay GoodBye"
    format_message message
    continue_message
  end

  def exit
    puts "Have a nice day!"
  end

  def show_results(result_list)
    if result_list.empty?
      puts "No results found."
      return continue_message
    end
    format_message result_list
    continue_message
  end

  def continue_message
    puts "\nWhat else would you like me to do for you? "\
      "Type 'help' to view commands"
  end
end
