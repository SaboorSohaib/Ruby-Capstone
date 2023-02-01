require '../classes/musicalbum.rb'

describe MusicAlbum do
    before :each do
        @musicalbum1 = MusicAlbum.new ('twilight' , '2000-23-01' , true)
    end

    context 'Creating MusicAlbum is instance of class will be @musicalbum1' do
        it 'should take parameters and return source object' do
            @musicalbum1.should be_an_instance_of MusicAlbum
        end
    end
end
end
