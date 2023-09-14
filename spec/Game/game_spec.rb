require_relative '../spec_helper'

describe Game do
  before :all do
    @game = Game.new(true, '2022-09-08', '2010-12-23')
  end

  context 'When creating game class instance' do
    it 'Create Game object' do
      expect(@game).to be_instance_of Game
    end
  end

  context 'When implementing can_be_archived?() method' do
    it "should return true if parent's method returns true AND if last_played_at is older than 2 years" do
      expect(@game.archived).to be false
    end
  end
end
