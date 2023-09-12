require 'json'

class StoreData
  def store_all(game_manager)
    store_games(game_manager)
  end

  def store_games(game_manager)
    games = game_manager.all_games
    data = games.map do |game|
      { multiplayer: game.multiplayer, last_played_at: game.last_played_at, publish_date: game.publish_date,
        first_name: game.author.first_name, last_name: game.author.last_name }
    end
    File.open(
      'lib/Data/JSON/games.json', 'w'
    ) do |file|
      file.puts(data.to_json)
    end
  end
end

