require_relative 'itme'

class Book < Item
  def initialize(publisher, cover_state, publish_date, archived)
    super(publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state = 'bad'
  end
end
