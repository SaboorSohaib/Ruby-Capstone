class Lable
    attr_accessor :title :color
    attr_reader :itme

  def initialize(_id, title, color, _itmes)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @itmes = []
  end

  def add_item(item)
    @itmes.push(item)
    item.lable = self
  end
end
