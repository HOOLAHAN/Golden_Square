# {{track_list}} Class Design Recipe

## 1. Describe the Problem

_As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them._

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE
class TrackList
  def initialize 
    # ...
  end
  def add_track(track) 
  
  end
end
```
## 3. Create Examples as Tests
_Make a list of examples of how the class will behave in different situations._
```ruby
# EXAMPLE
# 1
track = TrackList.new
track.add_track("Song 1") # => ["Song 1"]

# 2
track = TrackList.new
track.add_track("Song 1") # => ["Song 1"]
track.add_track("Song 2") # => ["Song 1", "Song 2"]

# 3
track = TrackList.new
track.add_track("Song 1") # => ["Song 1"]

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._