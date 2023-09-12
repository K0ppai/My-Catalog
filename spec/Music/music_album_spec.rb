require_relative '../spec_helper'

describe MusicAlbum do
  before :all do
    @music_album = MusicAlbum.new('2000-12-23')
  end

  context 'When creating MusicAlbum class' do
    it 'should have on_spotify instance variable' do
      expect(@music_album.on_spotify).to be false
    end
  end
end
