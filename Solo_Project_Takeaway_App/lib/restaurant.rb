# File: lib/restaurant.rb

class Restaurant
  def initialize
    @menu = ["#01 - Pizza - £10.50", "#02 - Chips - £5.00", "#03 - Hot Dog - £7.00", "#04 - Club Sandwich - £8.50"]
    @order = []
    @bill = []
  end

  def show_menu
    @menu.each do |item|
      puts item
    end
  end

  def add(dish_number)
    fail "Please choose a number from menu items 1 - 4" unless (dish_number.is_a? Integer) && dish_number > 0 && dish_number < @menu.length
    @order << @menu[dish_number - 1]
    # pushes chosen menu item to order array
  end

  def order
    return @order
  end

  def total
   return @order.join(' ').gsub!('£', '').split(' ').map(&:to_f).sum
  end

  def bill
    fail "Please add at least one item to the order" unless @order.length > 0
    @bill << "ORDER:"
    @bill << @order
    @bill << "TOTAL: £#{total}"
    @bill.each do |item|
      puts item
    end
    # prints the itemised bill with total at the bottom
  end

end

=begin
test = Restaurant.new
test.show_menu
test.add(1)
test.add(2)
test.total
test.bill
=end