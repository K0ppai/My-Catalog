require_relative '../spec_helper'

describe Genre do
  before :all do
    @music_album = Genre.new
  end

  context 'When creating Genre class' do
    it 'should have name instance variable' do
      expect(subject.name).to eq 'abc'
    end
  end
end