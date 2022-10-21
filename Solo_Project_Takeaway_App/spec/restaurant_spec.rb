# File: spec/restaurant_spec.rb

require 'restaurant'

describe Restaurant do
  context 'when the show_menu method is called' do
    it 'prints the menu' do
      menu = Restaurant.new
      expect(menu.show_menu).to eq ["#01 - pizza - £10.00", "#02 - chips - £5.00", "#03 - hot dog - £7.00"]
    end
  end
  context 'when a dish is added' do
    it 'populates the order array' do
      menu = Restaurant.new
      new_order = Restaurant.new
      new_order.add(1)
      expect(new_order.order).to eq ["#01 - pizza - £10.00"]
    end
  end
  context 'when multiple dishes are added' do
    it 'populates the order array' do
      menu = Restaurant.new
      new_order = Restaurant.new
      new_order.add(1)
      new_order.add(2)
      expect(new_order.order).to eq ["#01 - pizza - £10.00", "#02 - chips - £5.00"]
    end
  end
  context 'when the bill method is called' do
    it 'prints an itemised order with a total at the end' do
      menu = Restaurant.new
      new_order = Restaurant.new
      new_order.add(1)
      new_order.add(2)
      expect(new_order.total).to eq 15
    end
  end
end
