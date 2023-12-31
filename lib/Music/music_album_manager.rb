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
      puts "Go ahead and add a music to your library 📀 \e[34m"
    else
      puts "\e[35m Here is the Album List 🎶 📀"
      puts ''
      @albums.each_with_index do |album, index|
        print "\e[37m #{index + 1}) "
        puts "Genre: \"#{album.genre.name.upcase}\", Published Date:#{album.publish_date}, On Spotify?: #{album.on_spotify ? 'Yes' : 'No'}\e[34m"
      end
    end
    puts ''
  end

  def list_genres
    if @albums == []
      puts ''
      puts "🎶 Oops! 😬 It seems we don't have genre yet "
      puts "But don't worry, you can create your own! ✨  🖋️"
      puts 'Go ahead and add a music and genre to your library 📀'
    else
      puts "\e[35m"
      puts 'Here is the Genre List 🎶 📀'
      puts "\e[37m"
      @albums.each_with_index do |album, index|
        print "#{index + 1}) "
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
    puts " 🎉 Music Album [Genre: \"#{music_album.genre.name.upcase}\", Published Date: #{music_album.publish_date}, On Spotify?: #{music_album.on_spotify ? 'Yes' : 'No'}] Created Successfully! 🎮 🎶"
    puts "\e[34m"
  end

  def remove_album
    loop do
      puts "\e[35m"
      list_music_albums
      break if @albums.empty?

      puts "Choose the number of the album..\n"
      index = gets.chomp.to_i
      if index.positive? && index <= @albums.length
        @albums.delete_at(index - 1)
        puts "Album \"#{index}\" deleted successfully!"
        break
      else
        puts 'Please enter a valid number!'
      end
    end
  end
end
