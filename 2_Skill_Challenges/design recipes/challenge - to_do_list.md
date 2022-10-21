# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

method : to_do_check(text)
returns: true : false
if text contains "#TODO" or not

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
to_do_check("test") => false
to_do_check("#TODO test") => true

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
