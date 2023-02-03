require_relative './classes/book'
require_relative './classes/lable'
require_relative './item'
require_relative './classes/game'
require_relative './classes/author'
require_relative './classes/genre'
require_relative './classes/musicalbum'

class App
  def initialize
    @books = []
    @lables = []
    @games = []
    @authors = []
    @genres = []
    @musicalbums = []
  end

  def add_book
    puts 'Publisher:'
    publish = gets.chomp
    puts 'Cover State:'
    cover = gets.chomp
    puts 'publish Date (yyyy-dd-mm):'
    date = gets.chomp
    book = Book.new(publish, cover, date)
    @books.push(book)
    puts 'Would you like to add lable? (1)- Yes // (2)- No'
    options = gets.chomp.to_i
    return unless options == 1

    puts 'Choose a title for lable:'
    tit = gets.chomp
    puts 'Choose a color for the lable:'
    color = gets.chomp
    lable = Lable.new(tit, color)
    @lables.push(lable)
  end

  def list_all_books
    if @books.empty?
      puts "Sorry, We do not have any book\n\n"
    else
      @books.each do |bk|
        puts "Publisher:#{bk.publisher} Cover State:#{bk.cover_state} Publish Date:#{bk.publish_date}\n"
      end
    end
  end

  def list_all_lables
    if @lables.empty?
      puts "Sorry, We do not have any lables\n\n"
    else
      @lables.each { |lab| puts "Lable Title:#{lab.title} color:#{lab.color}\n" }
    end
  end

  def add_game
    puts 'Multiplayer:'
    multiplayer = gets.chomp
    puts 'last_played_at:'
    last_played_at = gets.chomp
    puts 'publish Date (yyyy-dd-mm):'
    date = gets.chomp
    game = Game.new(multiplayer, last_played_at, date)
    @games.push(game)
    puts 'Would you like to add author? (1)- Yes // (2)- No : '
    options = gets.chomp.to_i
    return unless options == 1

    puts 'Input First Name:'
    first_name = gets.chomp
    puts 'Input Last Name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author)
  end

  def list_all_games
    if @games.empty?
      puts "There are currently no games in the list\n\n"
    else
      @games.each do |game|
        puts "Multiplayer:#{game.multiplayer} last played at:#{game.last_played_at} Publish Date:#{game.publish_date}\n"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts "Sorry, We do not have any authors\n\n"
    else
      @authors.each { |author| puts "First Name:#{author.first_name} Last Name:#{author.last_name}\n" }
    end
  end

  def add_music_album
    print 'Music Album Name📛 : '
    name = gets.chomp
    print 'Music Album publish_date 📅: '
    publish_date = gets.chomp
    print 'please select on_spotify? : '
    on_spotify = gets.chomp
    music = MusicAlbum.new(name, publish_date, on_spotify)
    @musicalbums << music
    print 'Would you like to add author? (1)- Yes // (2)- No : '
    options = gets.chomp.to_i
    return unless options == 1

    print 'Genre name : '
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre
    puts "Your Music Album Added Successfully🆗"
  end

  def list_all_genres
    if @genres.empty?
      print "The Genre List is empty! please add Genre🤐.\n\n"
    else
      puts "Genre list, count(#{@genres.count})🙋 :\n\n"
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}) Name : '#{genre.name}, "
      end
    end
  end

  def list_all_music_album
    if @musicalbums.empty?
      print "The Music Album List is empty! please add Music🤐.\n\n"
    else
      puts "Music Album list, count(#{@musicalbums.count})🎶 :\n\n"
      @musicalbums.each_with_index do |music, index|
        puts "#{index + 1}  Name : '#{music.name}'",
             " Publish Date  : #{music.publish_date}",
             " On_Spotify: #{music.on_spotify}"
      end
    end
  end
end
