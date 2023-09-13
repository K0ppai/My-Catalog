require_relative 'music_album'
require_relative 'genre'

class MusicAlbumManager
  attr_reader :albums

  def initialize
    @albums = []
  end

  def list_music_albums
    puts 'There is no albums yet.' if @albums.empty?
    @albums.each_with_index do |album, index|
      print "#{index + 1}) "
      puts "Genre: \"#{album.genre.name.upcase}\", Published Date:#{album.publish_date}, On Spotify?: #{album.on_spotify ? 'Yes' : 'No'}"
    end
  end

  def list_genres
    puts 'There is no genres yet. Please create one.' if @albums.empty?
    @albums.each_with_index do |album, index|
      print "#{index + 1}) "
      puts album.genre.name.upcase
    end
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
    puts "Music Album [Genre: \"#{music_album.genre.name.upcase}\", Published Date: #{music_album.publish_date}, On Spotify?: #{music_album.on_spotify ? 'Yes' : 'No'}] Created Successfully!"
  end

  def remove_album
    loop do
      puts "Choose id of the album..\n"
      list_music_albums
      index = gets.chomp.to_i
      if index.positive? && index <= @albums.length
        @albums.delete_at(index - 1)
        puts "Album \"#{index}\" deleted successfully!"
        break
      else
        puts 'Please enter a valid id!'
      end
    end
  end
end
