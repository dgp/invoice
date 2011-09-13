class Product
  attr_reader :number, :detail, :price
  def initialize(number, detail, price)
    @products = [ ]
    @number = number
    @detail = detail
    @price = price
  end
  
end