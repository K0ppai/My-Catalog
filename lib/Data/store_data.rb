require 'json'

class StoreData
  def store_music_albums(albums)
    music_data = albums.map do |album|
      {
        Genre: album.genre.name,
        Is_On_Spotify: album.on_spotify,
        Published_Date: album.publish_date
      }
    end
    json_data = JSON.pretty_generate(music_data)
    File.write('./lib/Data/JSON/music_albums.json', json_data)
  end
end
