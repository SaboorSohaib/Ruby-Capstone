require_relative '../classes/game'
require_relative 'spec_helper'

describe Game do
  before :each do
    @game1 = Game.new Time.local(2022), 'should check the test_multiplayer', Time.local(2018)
    @game2 = Game.new Time.new(2009), Time.new(2018), true
  end
end
