require_relative '../spec_helper'

describe Genre do
  before :all do
    @author = Author.new('first', 'last')
    @item = double('Item')
  end

  context 'When creating Author object' do
    it 'Have parameters first_name and last_name' do
      expect(@author).to have_attributes(first_name: 'first', last_name: 'last')
    end
    it 'should have first_name and last_name instance variable' do
      expect(@author.first_name).to eq 'first'
      expect(@author.last_name).to eq 'last'
    end
  end

  context 'When implementing add_item method' do
    it 'should associate an item with an author and add it to the author\'s items' do
    expect(@item).to receive(:author=).with(@author)
    @author.add_item(@item)
    expect(@author.items).to include(@item)
  end
  end
end
