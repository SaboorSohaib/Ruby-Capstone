#!/usr/bin/env ruby
require_relative './app'

def main
  app = App.new
  response = nil

  puts "Welcome Catalog App!\n\n"
  while response != '4'
    puts "Please choose an option by enter in a number from 1 to 7:\n\n"
    puts '1 - List all books'
    puts '2 - List all lables'
    puts '3 - Add a book'
    response = gets.chomp
    case response
    when '1'
      app.list_all_books
    when '2'
      app.list_all_lables
    when '3'
      app.add_book
    when '4'
      puts 'Thank you for using this app!'
    end
  end
end
main
