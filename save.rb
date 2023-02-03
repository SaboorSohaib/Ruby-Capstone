def list_all_stored_books
  if File.exist?('book.json') && File.zero?('book.json')
    bookfile = File.open('book.json')
    bookjson = bookfile.read
    JSON.parse(bookjson).map do |bk|
      example = Book.new(bk['Publisher'], bk['Cover State'], ['Publish Date'])
      @books.push(example)
    end
    bookfile.close
  else
    File.new('book.json', 'w')
  end
end
