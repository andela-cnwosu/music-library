module Helper
  def show_results(result_list)
    if result_list.empty?
      puts "No results found."
      return continue_message
    end
    Message.format result_list
    Message.continue
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