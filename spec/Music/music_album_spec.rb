require_relative '../spec_helper'

describe MusicAlbum do
  before :all do
    @music_album = MusicAlbum.new('2000-1-23', true)
  end

  context 'When creating MusicAlbum class' do
    it 'should have on_spotify instance variable' do
      expect(@music_album.on_spotify).to be true
    end
  end

  context 'When implementing can_be_archived?() method' do
    it "should return true if parent's method returns true AND if on_spotify equals true" do
      can_be_archived = @music_album.can_be_archived?
      expect(can_be_archived).to be true
    end
  end
end
