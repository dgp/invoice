require File.dirname(__FILE__) + '/product'

class Invoice 
  attr_reader :invoice_no, :invoice_date, :products, :total_product_price
  def initialize(invoice_no, invoice_date)
    @products = [ ]
    @invoice_no = invoice_no
    @invoice_date = invoice_date
  end
  
  def add_product(sq_no, product_name, no_of_team_member, hours_worked, payment_per_hour)
    @products.push(Product.new(sq_no, product_name, no_of_team_member, hours_worked, payment_per_hour, (payment_per_hour * hours_worked)))
  end
  
  def calculate_total_product_price()
    total_price = 0
    length = @products.length - 1
    for i in 0..length
      product = @products[i]
      total_price += product.price
    end
    @total_product_price = total_price
    return @total_product_price
  end
  
  def make_payement(amount)
    if is_paid_invoice(amount)
      return 'paid_invoice'
    elsif is_partial_paid_invoice(amount)
      remaining_payment_for_partial_payment()
      return 'partial_paid_invoice'
    elsif is_un_paid_invoice(amount)
      return 'un_paid_invoice'
    else
      return nil
    end
  end
  
  def is_paid_invoice(amount)
    amount == @total_product_price
  end
  
  def is_partial_paid_invoice(amount)
    if amount && amount < @total_product_price && amount > 0
      @total_product_price = @total_product_price - amount
    end
  end
  
  def is_un_paid_invoice(amount)
    amount == 0
  end
  
  def remaining_payment_for_partial_payment()
    return @total_product_price
  end
    
end
  

