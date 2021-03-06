class MusicLibraryController
  include Helper, Formatter
  attr_accessor :path, :command

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input
  rescue Interrupt
    process_command "exit"
  end

  def input
    Message.start
    while @command != "exit"
      @command = gets.chomp.downcase
      process_command @command
    end
  end

  def process_command(command)
    Message.no_songs_error if Song.all.empty?
    command_method = command.tr(' ', '_')
    unless MusicLibraryController.method_defined? command_method
      Message.invalid_command
      return Message.continue
    end
    send command_method
  end

  def list_songs
    song_list = Song.all.map.with_index(1) do |song, index|
      "#{index}. #{format_song(song)}"
    end
    show_results song_list
  end

  def list_artists
    Artist.list_names
  end

  def list_genres
    Genre.list_names
  end

  def play_song
    Message.ask_track
    track = get_track
    puts "Playing #{track}"
    Message.continue
  end

  def list_artist
    Message.ask_artist
    name = gets.chomp
    Artist.find_songs_by_name(name)
  end

  def list_genre
    Message.ask_genre
    name = gets.chomp
    Genre.find_songs_by_name(name)
  end

  def help
    Message.help
    Message.continue
  end

  def exit
    Message.exit
  end
end
