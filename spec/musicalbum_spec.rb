require_relative '../classes/musicalbum'
require_relative 'spec_helper'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('Menhas', '2019-07-09', true)
  end

  context 'Creating MusicAlbum is instance of class will be @musicalbum1' do
    it 'should take parameters and return source object' do
      @music_album.should be_an_instance_of MusicAlbum
    end
  end

  context 'when MusicAlbum checking by name' do
    it 'should take parameter and return source object' do
      @music_album.name.sh eql 'Menhas'
    end
  end
end
