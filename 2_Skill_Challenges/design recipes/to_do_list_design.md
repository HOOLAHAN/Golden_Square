# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE
class ToDo
  def initialize
    # ...
  end
  def task_list(task) 
    # task is a string
    # returns list
  end
  def completed_task
    # Throws an exception if no task is set
    # Otherwise, returns an updates list
  end
end
```
## 3. Create Examples as Tests
_Make a list of examples of how the class will behave in different situations._
```ruby
# EXAMPLE
# 1
add_task = ToDo.new
add_task.task_list("Vacuum")  # => ["Vacuum"]

# 2
add_task = ToDo.new
add_task.task_list("Vacuum")  # => ["Vacuum"]
add_task.task_list("Dishes")  # => ["Vacuum", "Dishes"]

# 3
add_task = ToDo.new
add_task.task_list("Dishes")  # => ["Dishes"]
add_task.task_list("Dishes")  # => "Item already on list"

# 4
add_task = ToDo.new
add_task.task_list("Dishes") # => ["Vacuum"]
add_task.task_list("Vacuum") #=> ["Vacuum", "Dishes"]
add_task.completed_task("Vacuum")# => ["Dishes"]

# 5
add_task = ToDo.new
add_task.task_list("Dishes")  # => ["Dishes"]
add_task.completed_task("Dishes")  # => "Empty to-do list"

# 6
add_task = ToDo.new
add_task.task_list("Vacuum")  # => ["Vacuum"]
add_task.completed_task("Dishes")  # => "Item not on list"

# 7
add_task = ToDo.new
add_task.task_list("Vacuum")  # => ["Vacuum"]
add_task.completed_task("Dishes")  # => "Item not on list"
add_task.task_list("Bins")  # => ["Vacuum", "Bins"]

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

