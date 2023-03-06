class Product 
  attr_accessor :name, :amount, :price
    
  def initialize(name, amount, price)
    @name = name
    @amount = amount
    @price = price
  end

  def totalValue()
    @amount*@price
  end
end