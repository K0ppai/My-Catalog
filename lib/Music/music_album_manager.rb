require_relative 'music_album'
require_relative 'genre'

class MusicAlbumManager
  attr_reader :albums

  def initialize
    @albums = []
  end

  def list_music_albums
    puts "\e[37m"
    if @albums == []
      puts "🎶 Oops! 😬 It seems we don't have albums yet "
      puts "But don't worry, you can create your own! ✨  🖋️"
      puts 'Go ahead and add a music to your library 📀'
    else
      puts "\e[35m"
      puts 'Here is the Music List 🎶 📀'
      puts ''
      @albums.each_with_index do |album, _index|
        puts "\e[37m Genre: \"#{album.genre.name.upcase}\", Published Date:#{album.publish_date}, On Spotify?: #{album.on_spotify ? 'Yes' : 'No'}"
      end
    end
    puts "\e[34m"
  end

  def list_genres
    if @albums == []
      puts "🎶 Oops! 😬 It seems we don't have genre yet "
      puts "But don't worry, you can create your own! ✨  🖋️"
      puts 'Go ahead and add a music and genre to your library 📀'
    else
      puts "\e[35m"
      puts 'Here is the Genre List 🎶 📀'
      puts "\e[37m"
      @albums.each_with_index do |album, index|
        print "#{index}) "
        puts album.genre.name.upcase
      end
    end
    puts "\e[34m"
  end

  def create_music_album
    puts 'When is it published? (Enter date in [yy/mm/dd] format)'
    publish_date = gets.chomp
    puts 'Is it on Spotify? [Y/N]: '
    on_spotify = gets.chomp.upcase
    case on_spotify
    when 'Y'
      music_album = MusicAlbum.new(publish_date, true)
    when 'N'
      music_album = MusicAlbum.new(publish_date, false)
    else
      puts 'Please enter a valid input!'
    end
    puts 'What is the Genre? '
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    music_album.genre = genre
    @albums << music_album
    puts "\e[35m"
    puts ' 🎉 Music Album Created Successfully! 🎮 🎶'
    puts "\e[34m"
  end
end
