require_relative '../item.rb'

class Book < Item
  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    parent = super
    parent || @cover_state == "bad"
  end
end