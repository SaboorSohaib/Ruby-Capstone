#!/usr/bin/env ruby
require_relative './app'
# rubocop:disable Metrics/CyclomaticComplexity

def main
  app = App.new
  response = nil

  puts "Welcome Catalog App!\n\n"
  while response != '10'
    puts "Please choose an option by enter in a number from 1 to 10:\n\n"
    puts '1 - List all books'
    puts '2 - List all lables'
    puts '3 - Add a book'
    puts '4 - Add a game'
    puts '5 - List all games'
    puts '6 - List all authors'
    puts '7 - List of all Genre'
    puts '8 - Add music Album '
    puts '9 - List of all Music Album'
    puts '10 - Exit App'

    response = gets.chomp
    case response
    when '1'
      app.list_all_books
    when '2'
      app.list_all_lables
    when '3'
      app.add_book
    when '4'
      app.add_game
    when '5'
      app.list_all_games
    when '6'
      app.list_all_authors
    when '7'
      app.list_all_genres
    when '8'
      app.add_music_album
    when '9'
      app.list_all_music_album
    when '10'
      app.quit_app
      puts 'Thank you for using this app!😃'
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
main
