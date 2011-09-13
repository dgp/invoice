class Product
  attr_reader :sq_no, :name, :price

  def initialize(sq_no, name, price)
    @sq_no = sq_no
    @name = name
    @price = price
  end
  
end