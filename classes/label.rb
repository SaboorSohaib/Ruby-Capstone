class Lable
  def initialize(_id, title, color, _itmes)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @itmes = []
  end
end
