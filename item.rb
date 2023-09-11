require 'date'

class Item
  attr_accessor :archived

  def initialize(genre = nil, author = nil, source = nil, label = nil, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
  
  def can_be_archived?
    current_year = Time.now.year
    published_year = @publish_date.year
    current_year - published_year > 10
  end

  private :can_be_archived?
end
