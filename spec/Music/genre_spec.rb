require_relative '../spec_helper'

describe Genre do
  before :all do
    @genre = Genre.new('abc')
    @item = Item.new('2000-12-12')
    @genre.add_item(@item)
  end
  
  context 'When creating Genre class' do
    it 'should have name instance variable' do
      expect(@genre.name).to eq 'abc'
    end
  end
  
  context "When implementing add_item method" do
    it "should take an instance of the Item class as an input" do
      expect {@genre.add_item(@item)}.not_to raise_error 
    end

    it "should add the input item to the collection of items" do
      expect(@genre.items[0]).to be @item 
    end

    it "should add self as a property of the item object" do
      expect(@item.genre).to be @genre  
    end
  end
end
