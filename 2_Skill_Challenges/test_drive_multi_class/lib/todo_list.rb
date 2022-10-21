# File: lib/todo_list.rb
class TodoList
  def initialize
    @todo_list = []
    @completed_list = []
  end

  def add(todo) 
    @todo_list << todo
    # todo is an instance of Todo
    # Returns nothing
  end

  def incomplete
    return @todo_list = @todo_list.filter { |task| !task.done? }
    # Returns all non-done todos
  end

  def complete
    return @completed_list = @todo_list.filter { |task| task.done? }
    # Returns all complete todos
  end

  def give_up!
    return @todo_list.each do |task|
      task.mark_done!
    end
    # Marks all todos as complete
  end
end