require 'json'
require_relative '../Music/music_album'
require_relative '../Music/genre'

class RetrieveData
  def retrieve_music_albums(music_albums)
    path = './lib/Data/JSON/music_albums.json'
    json_data = JSON.pretty_generate([])

    File.write(path, json_data) unless File.exist?(path)

    file = File.read(path)
    parsed_datas = JSON.parse(file)
    parsed_datas.map do |data|
      music_album = MusicAlbum.new(data['Published_Date'], data['Is_On_Spotify'])
      music_album.genre = Genre.new(data['Genre'])
      music_albums << music_album
    end
  end
end
