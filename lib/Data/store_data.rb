require 'json'

class StoreData
  def store_all(game_manager, music_manager, book_manager)
    store_games(game_manager)
    store_music_albums(music_manager.albums)
    store_books(book_manager)
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
      file.puts(JSON.pretty_generate(data))
    end
  end

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

  def store_books(books_manager)
    books_data = []
    return books_data if books_manager == []

    books_data = books_manager.booklist.map do |book|
      {
        publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state,
        title: book.label.title, color: book.label.color
      }
    end
    File.write('./lib/Data/JSON/books.json', JSON.pretty_generate(books_data))
  end
end
