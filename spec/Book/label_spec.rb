require_relative '../spec_helper'

describe Label do
  before :all do
    p 'Label testing'
  end

  before :each do
    @label1 = Label.new('Label Title', 'brown')
    @item = Item.new('2000-12-12')
  end

  describe '#initialize' do
    context 'When making a new book' do
      it 'takes 2 parameters and returns a new label object' do
        expect(@label1).to be_an_instance_of(Label)
      end
    end
  end

  describe '#methods' do
    context 'add_item' do
      it 'should take an instance of the Item class' do
        expect { @label1.add_item(@item) }.not_to raise_error
      end
      it 'should add the item to the list of items' do
        @label1.add_item(@item)
        @label1.add_item(@item)
        expect(@label1.items[0]).to be_an_instance_of Item
        expect(@label1.items[1]).to be_an_instance_of Item
      end
      it 'should add self as a property of the item object' do
        @label1.add_item(@item)
        expect(@item.label).to be @label1
      end
    end
  end
end
