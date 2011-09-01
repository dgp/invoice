require File.dirname(__FILE__) + '/product'
require 'date'

class Invoice 
  
  attr_reader :number, :date, :products, :total_product_price, :balance_un_paid_amount, :paid_amount, :balance_amount, :date 
  attr_accessor :seller, :buyer
  
  def initialize(number, date)
    
    @products = [ ]
    @date = Date.strptime(date)
    @un_paid_balance_amount = 0
    @balance_amount = 0
    @number = number
  end
  
  def add_product(sq_no, product_name, no_of_team_member, hours_worked, payment_per_hour)
    @products.push(Product.new(sq_no, product_name, no_of_team_member, hours_worked, payment_per_hour, (payment_per_hour * hours_worked)))
  end
  
  #TODO: find out better ways to doing this by looking into Array/Enumerable methods
  def calculate_total_product_price()
    total_price = 0
    length = @products.length - 1
    for i in 0..length
      product = @products[i]
      total_price += product.price 
    end
    @total_product_price = total_price
  end
  
  def set_seller(seller)
    @seller = seller
  end
  
  def set_buyer(buyer)
    @buyer = buyer
  end
  
  #TODO, you need to keep track of paid amount and the unpaid_balance should be calculated
  def make_payement(amount)
    if amount
      @paid_amount = amount
      @balance_amount = amount - @total_product_price
      @balance_un_paid_amount = @total_product_price - amount  
    end
  end
  
  def paid_invoice?
    @paid_amount == @total_product_price
  end
  
  # partially_paid?
  def partially_paid?
    @balance_un_paid_amount < @total_product_price
  end
  
  def un_paid_invoice?
    @balance_un_paid_amount == @total_product_price
  end
    
end
  

