module Concerns
  module Findable
    def find_by_name(name)
      all.detect do |model| 
        model.name.casecmp(name) == 0
      end
    end

    def find_or_create_by_name(name)
      model = find_by_name(name)
      return model if model
      create(name)
    end

    def find_songs_by_name(name)
      model = find_by_name(name)
      song_list = model.songs.map { |song| format_song song } unless model.nil?
      show_results song_list || []
    end
  end
end