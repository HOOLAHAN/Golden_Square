# File: spec/restaurant_spec.rb

require 'restaurant'

describe Restaurant do
  context 'when the show_menu method is called' do
    it 'prints the menu' do
      menu = Restaurant.new
      expect(menu.show_menu).to eq [["#1", "pizza", 10], ["#2", "chips", 5], ["#3", "hot dog", 7]]
    end
  end
end
