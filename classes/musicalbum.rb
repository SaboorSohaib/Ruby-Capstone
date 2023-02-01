require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :name

  def initialize(name, publish_date, on_spotify)
    super(publish_date)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
    @name = name
  end

  def can_be_archived?
    super && on_spotify
  end
end
