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

  def add_label(label)
    @label = label
    label.add_item(label)
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(genre)
  end

  def add_author(author)
    @author = author
    author.add_item(author)
  end

  private

  def can_be_archived?
    (Time.new.year - @publish_date.year) > 10
  end
end
