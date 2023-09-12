require_relative "music_album"
require_relative "genre"

class MusicAlbumManager
  def initialize
    @albums = []
  end

  def list_music_albums
    @albums.each_with_index do |album, index|
      puts "Genre: #{album.genre.name}, Published Date:#{album.publish_date}, #{album.on_spotify ? "Available on Spotify" : "Not Available on Spotify"}"
    end
  end

  def list_genres
    @albums.each_with_index do |album, index|
      puts "#{album.genre.name}"
    end
  end

  def create_music_album
    puts "When is it published? Enter data in [yy/mm/dd] format."
    publish_date = gets.chomp
    puts "Is it on Spotify? [Y/N]: "
    on_spotify = gets.chomp.upcase
    case on_spotify
    when "Y"
      music_album = MusicAlbum.new(publish_date, true)
    when "N"
      music_album = MusicAlbum.new(publish_date, false)
    else
      puts "Please enter a valid input!"
    end
    puts "What is the Genre? "
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    music_album.genre = genre
    @albums << music_album
    puts "Music Album Created Successfully!"
  end
end
