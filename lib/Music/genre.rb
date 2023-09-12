require_relative '../item'

class Genre
  attr_accessor :items
  attr_reader :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @items = []
    @name = name
  end

  def add_item(item)
    @items << item if item.instance_of?(Item)
    item.genre = 
  end
end
