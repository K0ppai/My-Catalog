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

    context 'setters' do
      it 'should change the genre property of the item' do
        genre = Genre.new('pop')
        @new_item1.genre = genre
        expect(@new_item1.genre).to be genre
      end

      it 'should change the label property of the item' do
        label = Label.new('new', 'yellow')
        @new_item2.label = label
        expect(@new_item2.label).to be label
      end
    end

    context 'When adding author to Item instance' do
      it "should set the author and add the item to the author's items" do
        author = double('Author')
        allow(author).to receive(:items) { [@new_item1] }
        @new_item1.author = author
        expect(author.items).to include(@new_item1)
        expect(@new_item1.author).to eq(author)
      end
    end

  end
end
