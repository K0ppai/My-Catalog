require_relative '../game'
require_relative 'author_manager'

class GameManager
  attr_reader :all_games

  def initialize
    @author_manager = AuthorManager.new
    @all_games = []
  end

  def list_all_games
    puts "\e[37m"
    if @all_games == []
      puts "🎮 Oops! 😬 It seems we don't have any games  "
      puts "But don't worry, you can create your own! ✨  🖋️"
      puts 'Go ahead and add a game to your collection 🎮'
    else
      puts "\e[35m"
      puts 'Here is the Game List 🎮'
      puts ''
      @all_games.each do |game|
        puts "\e[37m Multiplayer: #{game.multiplayer}, published: #{game.publish_date}, Last played: #{game.last_played_at}\e[34m"
      end
    end
    puts "\e[34m"
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
