require 'json'
require 'fileutils'

class SaveData
  def check_file_exists(filename)
    FileUtils.mkdir_p('./data')
    return unless !File.exist?('./data/music_album.json') && filename == 'music_album'

    FileUtils.touch('./data/music_album.json')
    FileUtils.touch('./data/games.json') if !File.exist?('./data/games.json') && filename == 'games'
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

  def save_games(games)
    games_array = []
    games.each do |game|
      game_obj = {
        publish_date: game.publish_date,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at

      }
      games_array << game_obj
    end
    return if games_array.empty?

    check_file_exists('games')
    File.write('./data/games.json', JSON.pretty_generate(games_array))
  end
end
