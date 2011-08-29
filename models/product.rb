class Product
  attr_reader :sq_no, :product_name, :no_of_team_member, :hours_worked, :phours_worked, :price, :products, :product
  
  def initialize(sq_no, product_name, no_of_team_member, hours_worked, payment_per_hour, price)
    @products = [ ]
    @sq_no = sq_no
    @product_name = product_name
    @no_of_team_member = no_of_team_member
    @hours_worked = hours_worked
    @payment_per_hour = payment_per_hour
    @price = price
  end
  
  def length
    @products.length
  end
  
  
end