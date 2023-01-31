class Lable
    attr_accessor :title :color
    attr_reader :itme

  def initialize(_id, title, color, _itmes)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @itmes = []
  end
end
