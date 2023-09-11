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
end