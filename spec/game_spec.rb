require_relative '../classes/game'
require_relative 'spec_helper'

describe Game do
  before :each do
    @game1 = Game.new Time.local(2022), 'should check the test_multiplayer', Time.local(2018)
    @game2 = Game.new Time.new(2009), Time.new(2018), true
  end

  describe '#NewGame' do
    it 'should check the instance of test game if it is an instance of the Game class' do
      expect(@game1).to be_instance_of Game
    end
  end

  describe 'can_be_archived?' do
    it 'Can not use can_be_archived method when it private' do
      expect(@game).not_to respond_to(:can_be_archived?)
    end
  end 
end
