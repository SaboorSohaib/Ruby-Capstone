require 'json'
require 'fileutils'

class SaveData
    def check_file_exists(filename)
        FileUtils.mkdir_p('./data')
        FileUtils.touch('./data/music_album.json') if !File.exist?('./data/music_album.json') && filename == 'music_album'
    end

    def save_music_album(music)
        music_album_array = []
        music.each do |mscalbm|
            music_obj = {
                id: mscalbm.id,
                name: mscalbm.name,
                publish_date: mscalbm.publish_date,
                on_spotify: mscalbm.on_spotify

            }
            music_album_array << music_obj
        end
        return if music_album_array.empty?
        
        check_file_exists('music_album')
        File.write('./data/music_album.json', JSON.pretty_generate(music_album_array))
    end
end
