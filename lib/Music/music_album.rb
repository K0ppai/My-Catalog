require_relative '../item'
require_relative 'genre'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def can_be_archived?
    parent_result = super
    parent_result && @on_spotify
  end
end
