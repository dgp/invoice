require File.dirname(__FILE__) + '/product'
require 'date'

class Invoice 
  
  attr_reader :number, :date, :products, :paid_amount, :date 
  attr_accessor :seller, :buyer
  
  def initialize(number, date)
    
    @products = [ ]
    @date = Date.strptime(date)
    @paid_amount = 0
    @number = number
  end
  
  def add_product(product_no, product_detail, product_price)
    @products.push(Product.new(product_no, product_detail, product_price))
  end
  
  #TODO: find out better ways to doing this by looking into Array/Enumerable methods
  def calculate_total_product_price
    total_price = @products.map{|product| product.price}
    total_price.reduce(:+)
  end
  
    
  #TODO, you need to keep track of paid amount and the unpaid_balance should be calculated
  def make_payement(amount)
    if amount
      @paid_amount = amount
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
  

