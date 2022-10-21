# File: lib/restaurant.rb

class Restaurant
  def initialize
    # @menu = [["#1", "pizza", 10], ["#2", "chips", 5], ["#3", "hot dog", 7]]
    @menu = ["#01 - pizza - £10.00", "#02 - chips - £5.00", "#03 - hot dog - £7.00"]
    @order = []
  end

  def show_menu
    @menu.each do |item|
      puts item
    end

    #@menu.each do |items|
     # items.each do |number, item, price|
        # print number, item, price, "\n"
     # end
    #end
  end

  def add(dish_number) 
    # write failing case for index with nil
    @order << @menu[dish_number - 1]
    # pushes item from menu array to order array
    # Returns nothing
  end

  def order
    return @order
    # Returns order array
  end

  def total
  #puts @order.map {|x| x[/\d+/]}
  values = [] 
  @order.join(' ').split(' ').each do |item|
    item.delete unless item.include? ('£')
  end
  end

  def bill

    # prints order array with total at the bottom
  end

end

test = Restaurant.new
test.show_menu
test.add(1)
test.add(2)
test.total
