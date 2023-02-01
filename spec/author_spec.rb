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
end
