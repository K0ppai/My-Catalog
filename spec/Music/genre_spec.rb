require_relative '../spec_helper'

describe Genre do
  before :all do
    @genre = Genre.new('abc')
  end
  
  context 'When creating Genre class' do
    it 'should have name instance variable' do
      expect(@genre.name).to eq 'abc'
    end
  end
  
  context "When implementing add_item method" do
    it "should take an instance of the Item class as an input" do
      item = Item.new('2000-12-12')
      @genre.add_item(item)
      expect(@genre.add_item(item)).not_to raise_error 
    end
  end
end
