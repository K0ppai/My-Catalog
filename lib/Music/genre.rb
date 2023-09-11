require_relative '../item'

class Genre
  attr_reader :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @items = []
    @name = name
  end
end