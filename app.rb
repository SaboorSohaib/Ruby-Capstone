require_relative './classes/book'
require_relative './classes/lable'
require_relative './item'
require_relative './classes/game'
require_relative './classes/author'

class App
  def initialize
    @books = []
    @lables = []
    @games = []
    @authors = []
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
    puts 'Would you like to add author? (1)- Yes // (2)- No'
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

  end
end
