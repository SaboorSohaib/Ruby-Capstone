require_relative '../classes/lable'
require_relative '../classes/book'
require_relative 'spec_helper'

describe Lable do
  context 'Testing the Label class'
  title = 'Javascript'
  color = 'green'
  lable = Lable.new(title, color)

  it 'should validate the title of the lable' do
    expect(lable.title).to eq title
  end

  it 'should validate the color of the lable' do
    expect(lable.color).to eq color
  end

  it 'should add item peoperly' do

    publisher = 'John'
    cover_state = 'Good'
    publish_date = '02/02/03'
    
    book = Book.new(publisher, cover_state, publish_date)
    title = 'Javascript'
    color = 'green'
    lable = Lable.new(title, color)
    lable.add_item(book)
    expect(lable.items.length).to eq 1
  end
end
