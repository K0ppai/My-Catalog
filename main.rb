ACTIONS = {
  1 => { method: :list_books },
  2 => { method: :list_music_albums },
  3 => { method: :list_movies },
  4 => { method: :list_games },
  5 => { method: :list_genres },
  6 => { method: :list_labels },
  7 => { method: :list_authors },
  8 => { method: :list_sources },
  9 => { method: :add_book },
  10 => { method: :add_music_album },
  11 => { method: :add_movie },
  12 => { method: :add_game },
  13 => { method: :exit_app }
}.freeze

class Main
  def run
    loop do
      display_options
      number = gets.chomp.to_i
      if number == 13
        puts 'Thank you for using this app'
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

  def display_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List of games'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - List all sources'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - Exit'
  end

  def exit; end

  # Define methods for each action here
  def list_books
    puts 'Listing all books...'
    # Implement the logic for listing books
  end

  def list_music_albums
    puts 'Listing all music albums...'
    # Implement the logic for listing music albums
  end

  def list_movies
    puts 'Listing all movies...'
    # Implement the logic for listing movies
  end

  def list_games
    puts 'Listing all games...'
    # Implement the logic for listing games
  end

  def list_genres
    puts 'Listing all genres...'
    # Implement the logic for listing genres
  end

  def list_labels
    puts 'Listing all labels...'
    # Implement the logic for listing labels
  end

  def list_authors
    puts 'Listing all authors...'
    # Implement the logic for listing authors
  end

  def list_sources
    puts 'Listing all sources...'
    # Implement the logic for listing sources
  end

  def add_book
    puts 'Adding a book...'
    # Implement the logic for adding a book
  end

  def add_music_album
    puts 'Adding a music album...'
    # Implement the logic for adding a music album
  end

  def add_movie
    puts 'Adding a movie...'
    # Implement the logic for adding a movie
  end

  def add_game
    puts 'Adding a game...'
    # Implement the logic for adding a game
  end
end

main = Main.new
main.run
