require_relative './classes/book'
require_relative './classes/lable'
require_relative './item'
require_relative './classes/game'
require_relative './classes/author'
require_relative './classes/genre'
require_relative './classes/musicalbum'
require_relative './iofile/read_data'
require_relative './iofile/save_data'
require_relative './classes/validate_date'
require 'colorize'
require 'date'
require 'json'

class App
  def initialize
    @books = []
    @lables = []
    @games = ReadData.new.read_games
    @authors = []
    @genres = []
    list_all_stored_books
    list_all_stored_lables
    @musicalbums = ReadData.new.read_music_album
  end

  def quit_app
    SaveData.new.save_music_album(@musicalbums)
    SaveData.new.save_games(@games)
  end

  def add_book
    puts 'Publisher:'
    publish = gets.chomp
    puts 'Cover State:'
    cover = gets.chomp
    puts 'publish Date (yyyy-dd-mm):'
    date = set_valid_date
    book = Book.new(publish, cover, date)
    @books.push(book)
    puts 'Would you like to add lable? (1)- Yes // (2)- No'
    options = gets.chomp.to_i
    return unless options == 1

    puts 'Choose a title for lable:'
    title = gets.chomp
    puts 'Choose a color for the lable:'
    color = gets.chomp
    lable = Lable.new(title, color)
    @lables.push(lable)
    all_lables_books
    puts 'Your Book Added Successfully✅'
  end

  def all_lables_books
    bkjson = []
    @books.each do |bk|
      bkjson.push({ publisher: bk.publisher, cover_state: bk.cover_state, publish_date: bk.publish_date })
    end
    bookjson = JSON.generate(bkjson)
    File.write('book.json', bookjson)

    labjson = []
    @lables.each do |lab|
      labjson.push({ title: lab.title, color: lab.color })
    end
    lablejson = JSON.generate(labjson)
    File.write('lable.json', lablejson)
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

  def list_all_stored_books
    if File.exist?('book.json') && !File.zero?('book.json')
      bookfile = File.open('book.json')
      bookjson = bookfile.read
      JSON.parse(bookjson).map do |bk|
        example = Book.new(bk['publisher'], bk['cover_state'], bk['publish_date'])
        @books.push(example)
      end
      bookfile.close
    else
      File.new('book.json', 'w')
    end
  end

  def list_all_stored_lables
    if File.exist?('lable.json') && !File.zero?('lable.json')
      lablefile = File.open('lable.json')
      lablejson = lablefile.read
      JSON.parse(lablejson).map do |lab|
        lablexample = Lable.new(lab['title'], lab['color'])
        @lables.push(lablexample)
      end
      lablefile.close
    else
      File.new('lable.json', 'w')
    end
  end

  def add_game
    puts 'publish Date (yyyy-dd-mm):'
    publish_date = set_valid_date
    puts 'Multiplayer:'
    multiplayer = gets.chomp
    puts 'last_played_at:'
    last_played_at = gets.chomp
    game = Game.new(publish_date, multiplayer, last_played_at)
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
    puts 'Your Game Added Successfully✅'
  end

  def list_all_games
    if @games.empty?
      puts "There are currently no games in the list\n\n"
    else
      @games.each_with_index do |game, index|
        puts "#{index + 1})  publish_date : '#{game.publish_date}'",
             "  Multiplayer  : '#{game.multiplayer}' ",
             " last_played_at : '#{game.last_played_at}' "
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
    puts 'Your Music Album Added Successfully✅'
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
        puts "#{index + 1})  Name : '#{music.name}'",
             " Publish Date  : #{music.publish_date}",
             " On_Spotify: #{music.on_spotify}"
      end
    end
  end
end
