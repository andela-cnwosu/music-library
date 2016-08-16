module Formatter
  def format_song_params(filename)
    split_name = split_filename filename
    artist=(Artist.find_or_create_by_name split_name[1])
    genre=(Genre.find_or_create_by_name split_name[2])
    [split_name[0], artist, genre]
  end

  def split_filename(filename)
    split_name = filename.gsub('.mp3', '').split(" - ")
    [split_name[1], split_name[0], split_name[2]]
  end

  def format_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end