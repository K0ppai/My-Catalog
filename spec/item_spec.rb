require_relative 'spec_helper'


describe Item do
  before :all do
    p 'Item testing'
  end

  before :each do
    @new_item1 = Item.new('2020-03-12')
    @new_item2 = Item.new('2012-09-10')
    @new_item3 = Item.new('2000-12-12')
  end


  describe '#initialize' do
    context 'When making a new item' do
      it 'takes 1 parameter and returns a new item object' do
        expect(@new_item1).to be_an_instance_of Item
        expect(@new_item2).to be_an_instance_of Item
        expect(@new_item3).to be_an_instance_of Item
      end
    end
  end

  describe '#methods' do
    context 'can_be_archived?' do
      it 'should return true if publish_date > 10 years' do
        result1 = @new_item1.send(:can_be_archived?)
        result2 = @new_item2.send(:can_be_archived?)
        result3 = @new_item3.send(:can_be_archived?)

        expect(result1).to be false
        expect(result2).to be true
        expect(result3).to be true
      end
    end

    context 'move_to_archive' do
      it 'should change the archive property if can_be_archived is true' do
        @new_item1.move_to_archive
        expect(@new_item1.archived).to be false
        @new_item2.move_to_archive
        expect(@new_item2.archived).to be true
        @new_item3.move_to_archive
        expect(@new_item3.archived).to be true
      end
    end
  end
end
