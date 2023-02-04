require_relative '../classes/genre'
require_relative 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Rashid Menhas')
  end

  context 'Creating Genre is instance of class will be @genre' do
    it 'should take parameters and return source object' do
      @genre.should be_an_instance_of Genre
    end
  end

  context 'when Genre checking by name' do
    it 'should take parameter and return source object' do
      @genre.name.should eql 'Rashid Menhas'
    end
  end
end
