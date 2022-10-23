# File: spec/restaurant_spec.rb

require 'restaurant'

describe Restaurant do
  context 'when the show_menu method is called' do
    it 'prints the menu' do
      menu = Restaurant.new
      expect(menu.show_menu).to eq ["#01 - Pizza - £10.50", "#02 - Chips - £5.00", "#03 - Hot Dog - £7.00", "#04 - Club Sandwich - £8.50"]
    end
  end
  context 'when a dish is added' do
    it 'populates the order array' do
      menu = Restaurant.new
      new_order = Restaurant.new
      new_order.add(1)
      expect(new_order.order).to eq ["#01 - Pizza - £10.50"]
    end
  end
  context 'when multiple dishes are added' do
    it 'populates the order array' do
      menu = Restaurant.new
      new_order = Restaurant.new
      new_order.add(1)
      new_order.add(2)
      expect(new_order.order).to eq ["#01 - Pizza - £10.50", "#02 - Chips - £5.00"]
    end
  end
  context 'when a dish chosen is not a valid number ' do
    it 'fails' do
      menu = Restaurant.new
      new_order = Restaurant.new
      expect { new_order.add(6) }.to raise_error "Please choose a number from menu items 1 - 4"
    end
    it 'fails' do
      menu = Restaurant.new
      new_order = Restaurant.new
      expect { new_order.add("four") }.to raise_error "Please choose a number from menu items 1 - 4"
    end
  end
  context 'when the total method is called' do
    it 'sums the total of the order' do
      menu = Restaurant.new
      new_order = Restaurant.new
      new_order.add(1)
      new_order.add(2)
      expect(new_order.total).to eq 15.5
    end
  end
  context 'when the bill method is called' do
    it 'prints an itemised order with a total at the end' do
      menu = Restaurant.new
      new_order = Restaurant.new
      new_order.add(1)
      new_order.add(2)
      expect(new_order.bill).to eq ["ORDER:", ["#01 - Pizza - £10.50", "#02 - Chips - £5.00"], "TOTAL: £15.5"]
    end
  end
  context 'when the bill method is called with no items added to the order' do
    it 'fails' do
      menu = Restaurant.new
      new_order = Restaurant.new
      expect { new_order.bill }.to raise_error "Please add at least one item to the order"
    end
  end
end
