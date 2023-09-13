require_relative 'lib/Book/book_manager'
require_relative 'lib/Music/music_album_manager'
require_relative 'lib/Game/Managers/game_manager'
require_relative 'lib/Data/store_data'
require_relative 'lib/Data/retrieve_data'

def display_header
  puts "\e[35m" # Set the text color to purple
  puts '***********************************************************'
  puts '  📚 🎶 🎮  Welcome to My-Catalog Console App  🎮 🎶 📚  '
  puts '***********************************************************'
  puts ''
  puts '🌟 Get ready to 🌍 explore, 🕵️‍♂️ discover, and 🚀 have a blast! 🎉'
  puts ''
  puts '🤔 What would you like to do today? 🤖'
  puts "\e[34m"
end

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
  10 => { method: :exit_app }
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
    selected_option = nil
    loop do
      system('clear')
      display_options(selected_option)
      number = gets.chomp.to_i
      selected_option = number
      if number == 10
        @store_data.store_all(@game_manager, @music_album_manager)
        exit_msg
        break
      end
      action = ACTIONS[number]
      if action
        send(action[:method])
      else
        puts 'Enter a valid number'
      end
    end
  end

  def display_options(selected_option)
    options = [
      '1️⃣   List all books 📚',
      '2️⃣   List all music albums 🎶 📀',
      '3️⃣   List of games 🎮',
      '4️⃣   List all genres  🎵 🎶',
      '5️⃣   List all labels 🏷️  📚',
      '6️⃣   List all authors ✍️  📖',
      '7️⃣   Add a book 📚 ✏️',
      '8️⃣   Add a music album 🎶 📀 🎵',
      '9️⃣   Add a game 🎮 🕹️',
      '🔟  Exit 🚪 👋'
    ]

    options.each_with_index do |option, index|
      if (index + 1) == selected_option
        puts "\e[34m👉 #{option}"
      else
        puts option
      end
    end
    print "\e[37mEnter Code: "
  end

  def list_books
    @book_manager.list_all_books
  end

  def list_music_albums
    @music_album_manager.list_music_albums
  end

  def list_games
    @game_manager.list_all_games
  end

  def list_genres
    @music_album_manager.list_genres
  end

  def list_labels
    @book_manager.list_all_labels
  end

  def list_authors
    @game_manager.list_all_authors
  end

  def add_book
    puts 'Great Choice, what is the state of the Book? [excellent/good/bad]'
    cover_state = gets.chomp
    puts 'When was it pubished? Enter a Date'
    publish_date = gets.chomp
    puts 'Who was the publisher'
    publisher = gets.chomp
    puts 'Tell us about the book in 1 word Eg. Gift/New/Antique/Rare/Ancient'
    title = gets.chomp
    puts 'Finally, what color label should it have?'
    color = gets.chomp
    @book_manager.add_book(publish_date, publisher, cover_state, title, color)
  end

  def add_music_album
    @music_album_manager.create_music_album
  end

  def add_game
    puts 'Great Choice, is the game Multiplayer? [yes/no]'
    input = gets.chomp
    multiplayer = input == 'yes'
    print 'When was it pubished? Enter a Date [yy-mm-dd]: '
    publish_date = gets.chomp
    print 'When was it last played? Enter a Date [yy-mm-dd]: '
    last_played_at = gets.chomp
    puts 'Finally, what author should it have?'
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    @game_manager.add_game(multiplayer, last_played_at, publish_date, first_name, last_name)
    puts "\e[35m"
    puts ' 🎉 Game created successfully! 🎮✨'
    puts "\e[34m"
  end

  def exit_msg
    puts "\e[35m"
    puts '🎉 Thank you for exploring our library, music collection, and game center! 📚 🎶 🎮'
    puts '🌟 We hope you had a fantastic time with us! 🌟'
    puts "\e[37m"
  end
end
display_header
main = Main.new
main.run
