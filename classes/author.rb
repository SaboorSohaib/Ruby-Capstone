class Author
  attr_accessor :first_name, :last_name, :id
  attr_reader :items

  def initialize(first_name, last_name)
    @id = Random.rand(1...100)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end
end