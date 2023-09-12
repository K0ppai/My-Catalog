require "date"

class Item
  attr_accessor :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def can_be_archived?
    current_year = Time.now.year
    published_year = @publish_date.year
    current_year - published_year > 10
  end

  private :can_be_archived?

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def author=(author)
    @author = author
    author.items.push(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end
end
