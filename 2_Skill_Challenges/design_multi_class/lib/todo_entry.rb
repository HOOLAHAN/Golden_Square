# File: lib/search_tool.rb

class TodoEntry
  def initialize
    @todo_list = []
  end

  def add(task) 
    @todo_list << task
    # Returns nothing
  end

  def todos # Returns list
   return @todo_list
  end

end