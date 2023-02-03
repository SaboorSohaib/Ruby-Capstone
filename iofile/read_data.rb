require 'json'

class ReadData
  def read_music_album
    music_album = []
    return music_album unless File.exist?('./data/music_album.json')

    file = File.open('./data/music_album.json')
    data = JSON.parse(file.read)
    data.each do |music|
      music_album << MusicAlbum.new(music['name'], music['publish_data'], music['on_spotify'])
    end
    file.close
    music_album
  end
end
