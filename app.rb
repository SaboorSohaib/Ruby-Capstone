require_relative './classes/book'
require_relative './classes/lable'
require_relative './item'

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
    
  end
end
