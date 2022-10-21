# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

_As a user_
_So that I can manage my time_
_I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute._

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

method - read_time(text)
text to be inputted as a string
output will be the readtime in minutes and seconds

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
read_time("test") => "0 seconds"
read_time("words"*200) => "60 seconds"
read_time(nil) throws an error
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
