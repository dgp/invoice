class Product
  attr_reader :sq_no, :no_of_team_member, :hours_worked, :payment_per_hour, :price, :products
  def initialize(sq_no, no_of_team_member, hours_worked, payment_per_hour)
    @products = [ ]
    @sq_no = sq_no
    @no_of_team_member = no_of_team_member
    @hours_worked = hours_worked
    @payment_per_hour = payment_per_hour
    @price = payment_per_hour * hours_worked
  end
  
end