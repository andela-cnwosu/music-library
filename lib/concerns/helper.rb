module Helper
  def show_results(result_list)
    if result_list.empty?
      Message.empty_result
      return Message.continue
    end
    Message.format result_list
    Message.continue
  end

  def get_track
    track = convert_to_integer gets.chomp
    while track.nil? || Song.all.size < track || track < 1
      Message.invalid_track
      track = convert_to_integer gets.chomp
    end
    format_song Song.all[track - 1]
  end

  def convert_to_integer(track)
    Integer(track) rescue nil
  end
end