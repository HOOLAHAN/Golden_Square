

# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌─────────────────────────┐
│ Restaurant              │
│ - show menu             │
│ - add(dish_number)      │
│ - order                 │
│ - total                 │
│ - bill                  │
└───────────┬─────────────┘
┌─────────────────────────┐
│ Twilio                  │
│                         │
│ initialize (order)      |
| complete_order          |
| send_text(text_message) |
└─────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Restaurant
  def initialize
    # menu as a pre-populated array
    # order as an empty array
    # dish 
  end

  def show_menu
    # prints the menu
  end

  def add(dish_number) 
    # pushes item from menu array to order array
    # Returns nothing
  end

  def order
    # Returns order array
  end

  def total
    #returns the sum of the items on the order array
  end

  def bill
    # prints order array with total at the bottom
  end

end

class Twilio
  def initialize(bill) # bill is an array - instance of Menu
  end
  def send(message)
    # sends text message using Twilio API
  end
end
```
## 3. Create Examples as Integration Tests
_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._
```ruby
# EXAMPLE


```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE
# 1 - show the menu
menu = Restaurant.new
menu.show_menu # => [["#1", "pizza", 10], ["#2", "chips", 5], ["#3", "hot dog", 7]]

# 2 - add to order
menu = Restaurant.new
new_order = Restaurant.new
new_order.add("#1") 
expect(new_order.order).to eq # => [["#1", "pizza", 10]]

# 3 - total_order
menu = Restaurant.new
new_order = Restaurant.new
new_order.add("#1")
new_order.add("#2")
expect(new_order.bill).to eq # => [["#1", "pizza", 10], ["#2", "chips", 5]] "TOTAL: 15"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
