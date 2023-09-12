class RetrieveData
  def retrieve_all(game_manager)
    retrieve_games(game_manager)
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
end
