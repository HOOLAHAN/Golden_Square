# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries_

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
                  ┌───────────────────────---------──┐
                  │                                  │
                  │     Diary                        │
                  │                                  │
                  │     initialize                   │
                  │     add(entry)                   │
                  │     all                          │
                  │     readable_entries(wpm,minutes)|
                  │     find_contacts                │
                  │     show_contacts                │
                  └──┬─────────────────┬────---------┘
                     │                 │
                     │                 │
                     │                 │
┌────────────────────▼─────┐      ┌────▼────────────────────┐
│                          │      │                         │
│ DiaryEntry               │      │   TodoEntry             │
│-initialize               │      │  -initialize            │
│-title                    │      │  -add(task)             │
│-contents                 │      │  -todos                 │
│-count_words              │      │                         │
└──────────────────────────┘      └─────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class DiaryEntry
  def initialize(title, contents)
    # title, contents are strings
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end
end

class TodoEntry
  def initialize # todo list
  end

  def add(task)
    # add task to list
    # Returns nothing
  end

  def todos
  # Returns list
  end
end

class Diary

  def initialize
    # @entries = []
    # @readable_array = []
    # @contacts_list = []
  end

  def add(entry) 
    # entry is an instance of DiaryEntry
    # Returns nothing
  end

  def all
    # Returns a list of instances of DiaryEntry
  end

  def readable_entries(wpm, minutes)
    # Returns all instances which the user could read in the 
    # minutes they have available given their reading speed.
  end

  def find_contacts

  end
  
  def show_contacts

  end
  
end

```
## 3. Create Examples as Integration Tests
_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._
```ruby
# EXAMPLE
# 1
    journal = Diary.new
    entry = DiaryEntry.new("title1", "contents1")
    journal.add(entry)
    expect(journal.all) # => [entry]
# 2
    journal = Diary.new
    entry1 = DiaryEntry.new("title1", "contents1")
    entry2 = DiaryEntry.new("title2", "contents2")
    journal.add(entry1)
    journal.add(entry2)
    expect(journal.all) # => [entry1, entry2]
# 3
    journal = Diary.new
    entry1 = DiaryEntry.new("title1", "one two")
    entry2 = DiaryEntry.new("title2", "one two three")
    entry3 = DiaryEntry.new("title2", "one two three four")
    journal.add(entry1)
    journal.add(entry2)
    journal.add(entry3)
    expect(journal.readable_entries(3, 1)) # => [entry1, entry2]
# 4      
    journal = Diary.new
    entry1 = DiaryEntry.new("title1", "one two")
    entry2 = DiaryEntry.new("title2", "one two three")
    journal.add(entry1)
    journal.add(entry2)
    expect(journal.readable_entries(1, 1)).to eq []
# 5
    entry1 = DiaryEntry.new("title1", "one two")
    entry2 = DiaryEntry.new("title2", "one two three")
    entry3 = DiaryEntry.new("title2", "one two three four")
    entry4 = DiaryEntry.new("title1", "one 07849378136 two")
    entry5 = DiaryEntry.new("title2", "one two three 07781368493")
    entry6 = DiaryEntry.new("title2", "one two three four")
    journal.add(entry1)
    journal.add(entry2)
    journal.add(entry3)
    journal.add(entry4)
    journal.add(entry5)
    journal.add(entry6)
    expect(journal.find_contacts) # => ["07849378136", "07781368493"]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE
# TodoList
# 1
  new_list = TodoEntry.new
  expect(new_list.todos) # => []
# 2
  new_list = TodoEntry.new
  new_list.add("vacuum")
  expect(new_list.todos) # => ["vacuum"]
# 3  
  new_list = TodoEntry.new
  new_list.add("vacuum")
  new_list.add("clean")
  new_list.add("sweep")
  expect(new_list.todos) # => ["vacuum", "clean", "sweep"]

# DiaryEntry
# 1
  entry = DiaryEntry.new("title1", "contents1")
  expect(entry.title).to eq "title1"
  expect(entry.contents) # => "contents1"
# 2
  entry = DiaryEntry.new("title1", "Here is some content")
  expect(entry.count_words) # => 4
# 3
  entry = DiaryEntry.new("title1", "")
  expect(entry.count_words) # => 0
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
