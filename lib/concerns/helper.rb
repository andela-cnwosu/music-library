module Helper
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

  def begin_message
    if @command.nil?
      message = "Hi #{ENV['USER']}, I am your music buddy."\
        "What would you like me to do for you?\n"\
        "Type 'help' to view commands"
      format_message message
    end
  end

  def get_track
    track = convert_to_integer gets.chomp
    while track.nil? || Song.all.size < track || track < 1
      puts "Please enter a valid track number"
      track = convert_to_integer gets.chomp
    end
    format_song Song.all[track - 1]
  end

  def convert_to_integer(track)
    Integer(track) rescue nil
  end
end