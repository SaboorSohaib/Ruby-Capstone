require '../item'

class MusicAlbum < item
  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
end
