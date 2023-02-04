require_relative '../classes/book'
require_relative 'spec_helper'

describe 'Test the book' do
  context 'When testing the Book class' do
    it 'should create a book' do
      book = Book.new('UN', 'Good', 2022 / 2 / 10)
      expect(book.class).to eq Book
    end

    it 'Can not use can_be_archived method when it private' do
      expect(@book).not_to respond_to(:can_be_archived?)
    end
  end
end
