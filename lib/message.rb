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
    format message
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
end