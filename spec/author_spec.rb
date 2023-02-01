require_relative '../classes/author'
require_relative '../item'
require_relative 'spec_helper'

describe Author do
  before :each do
    @author = Author.new 'test_first_name', 'test_last_name'
  end

  it 'should check if the test author is an instance of Author class' do
    expect(@author).to be_instance_of Author
  end

  it 'check if item has been added to the author items list' do
    item = Item.new '2023/01/02'
    @author.add_item(item)
    expect(@author.items).to include(item)
  end
end
