require_relative '../game'
require_relative 'author_manager'

class GameManager
  def initialize
    @author_manager = AuthorManager.new
    @all_games = []
  end

  def list_all_games
    @all_games.each do |game|
      puts "Multiplayer: #{game.multiplayer}, published: #{game.publish_date}, Last played: #{game.last_played_at}"
    end
  end

  def list_all_authors
    @author_manager.list_all_authors
  end

  def add_game(multiplayer, last_played_at, publish_date, first_name, last_name)
    game = Game.new(multiplayer, last_played_at, publish_date)
    @author_manager.add_author(game, first_name, last_name)
    @all_games << game
  end
end
