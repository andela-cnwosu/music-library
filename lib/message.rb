class Message
  include Concerns

  def self.start
    if @command.nil?
      message = "Hi #{ENV['USER']}, I am your music buddy."\
        "What would you like me to do for you?\n"\
        "Type 'help' to view commands"
      format message
    end
  end

  def self.continue
    message = "\nWhat else would you like me to do for you? "\
      "Type 'help' to view commands"
    puts message
  end

  def self.help
    message = "list songs\tList all songs in your music library",
      "list artists\tList all artist names in your music library",
      "list genres\tList all song genres in your music library",
      "play song\tPlay a song in your music library",
      "list artist\tList all songs by an artist in your music library",
      "list genre\tList all songs in a genre in your music library",
      "exit\t\tSay GoodBye"
    format message
  end

  def self.format(message)
    puts "-" * 75, message, "-" * 75
  end

  def self.no_songs_error
    format "There are currently no songs in your library"
  end

  def self.ask_track
    format "What is the track number of the song?"
  end

  def self.ask_artist
    format "What is the name of the artist?"
  end

  def self.ask_genre
    format "What type of genre?"
  end

  def self.exit
    format "Have a nice day!"
  end

  def self.invalid_command
    format "Invalid command"
  end

  def self.invalid_track
    format "Please enter a valid track number"
  end

  def self.empty_result
    format "No results found."
  end

  def self.invalid_path
    format "Please include a valid path of the mp3 files"
  end
end