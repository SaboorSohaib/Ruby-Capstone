class Item
  attr_accessor :label, :genre, :author, :archived, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Time.new.year - @publish_date.year) > 10
  end
end
