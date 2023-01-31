class Lable
  attr_accessor :title, :color
  attr_reader :items

  def initialize(_id, title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.lable = self
  end
end
