require_relative "lib/Book/book_manager"
require_relative "lib/Music/music_album_manager"
require_relative "lib/Game/Managers/game_manager"
require_relative "lib/Data/store_data"
require_relative "lib/Data/retrieve_data"

ACTIONS = {
  1 => { method: :list_books },
  2 => { method: :list_music_albums },
  3 => { method: :list_games },
  4 => { method: :list_genres },
  5 => { method: :list_labels },
  6 => { method: :list_authors },
  7 => { method: :add_book },
  8 => { method: :add_music_album },
  9 => { method: :add_game },
  10 => { method: :remove_music_album },
  11 => { method: :exit_app },
}.freeze

class Main
  def initialize
    @book_manager = BookManager.new
    @music_album_manager = MusicAlbumManager.new
    @game_manager = GameManager.new
    @store_data = StoreData.new
    @retrieve_data = RetrieveData.new
  end

  def run
    @retrieve_data.retrieve_all(@game_manager, @music_album_manager)
    puts ""
    puts "WELCOME TO MY-CATALOG APP"
    puts ""
    loop do
      display_options
      number = gets.chomp.to_i
      if number == 11
        @store_data.store_all(@game_manager, @music_album_manager)
        puts "Saved Successfully!"
        puts "Thank you for using this app"
        break
      end
      action = ACTIONS[number]
      
      if action
        send(action[:method])
      else
        puts "Enter a valid number"
      end
      puts ""
    end
  end

  def display_options
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all music albums"
    puts "3 - List of games"
    puts "4 - List all genres"
    puts "5 - List all labels"
    puts "6 - List all authors"
    puts "7 - Add a book"
    puts "8 - Add a music album"
    puts "9 - Add a game"
    puts "10 - Remove a music album"
    puts "11 - Exit"
  end

  # Define methods for each action here
  def list_books
    puts "Here's Our Book List"
    @book_manager.list_all_books
    # Implement the logic for listing books
  end

  def list_music_albums
    @music_album_manager.list_music_albums
    # Implement the logic for listing music albums
  end

  def list_games
    @game_manager.list_all_games
  end

  def list_genres
    @music_album_manager.list_genres
    # Implement the logic for listing genres
  end

  def list_labels
    puts "Here is the Labels List"
    @book_manager.list_all_labels
    # Implement the logic for listing labels
  end

  def list_authors
    @game_manager.list_all_authors
  end

  def add_book
    puts "Great Choice, what is the state of the Book? [excellent/good/bad]"
    cover_state = gets.chomp
    puts "When was it pubished? Enter a Date"
    publish_date = gets.chomp
    puts "Who was the publisher"
    publisher = gets.chomp
    puts "Tell us about the book in 1 word Eg. Gift/New/Antique/Rare/Ancient"
    title = gets.chomp
    puts "Finally, what color label should it have?"
    color = gets.chomp
    @book_manager.add_book(publish_date, publisher, cover_state, title, color)
    # Implement the logic for adding a book
  end

  def add_music_album
    @music_album_manager.create_music_album
    # Implement the logic for adding a music album
  end

  def add_game
    print "multiplayer [true/false]: "
    input = gets.chomp
    multiplayer = input == "true"
    print "published at [yy-mm-dd]: "
    publish_date = gets.chomp
    print "last played at [yy-mm-dd]: "
    last_played_at = gets.chomp
    puts "Add author of game"
    print "First name: "
    first_name = gets.chomp
    print "Last name: "
    last_name = gets.chomp
    @game_manager.add_game(multiplayer, last_played_at, publish_date, first_name, last_name)
    puts "Game created successfully"
  end

  def remove_music_album
    @music_album_manager.remove_album
  end
end

main = Main.new
main.run
