module Helper
  def get_songs_by_type(type, name)
    model = type.find_by_name(name)
    song_list = model.songs.map { |song| format_song song } unless model.nil?
    show_results song_list || []
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

  def begin_message
    if @command.nil?
      message = "Hi #{ENV['USER']}, I am your music buddy."\
        "What would you like me to do for you?\n"\
        "Type 'help' to view commands"
      format_message message
    end
  end

  def get_track
    track = Integer(gets.chomp) rescue nil
    while track.nil? || Song.all.size < track || track < 1
      puts "Please enter a valid track number"
      track = Integer(gets.chomp) rescue nil
    end
    format_song Song.all[track - 1]
  end
end