require 'json'
require_relative '../Music/music_album'
require_relative '../Music/genre'

class RetrieveData
  def retrieve_all(game_manager, music_manager)
    retrieve_games(game_manager)
    retrieve_music_albums(music_manager.albums)
  end

  def retrieve_games(game_manager)
    return if File.empty?('lib/Data/JSON/games.json')

    file = File.read('lib/Data/JSON/games.json')
    data = JSON.parse(file, symbolize_names: true)
    data.each do |game_data|
      multiplayer = game_data[:multiplayer]
      last_played_at = game_data[:last_played_at]
      publish_date = game_data[:publish_date]
      first_name = game_data[:first_name]
      last_name = game_data[:last_name]
      game_manager.add_game(multiplayer, last_played_at, publish_date, first_name, last_name)
    end
  end

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
