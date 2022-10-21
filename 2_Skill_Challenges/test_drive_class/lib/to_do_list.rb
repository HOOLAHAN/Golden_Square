# File: lib/to_do_list.rb

class ToDo
  def initialize
    @to_do_array = []
    @completed_array = []
  end

  def task_list(task)
    if @to_do_array.include? task
      return "Item already on list"
    else
      return @to_do_array << task
    end
    # Returns a list
  end

  def completed_task(task)
    @completed_array << task
    if @to_do_array - @completed_array == []
      return "Empty to-do list"
    elsif !@to_do_array.include? task 
      return "Item not on list"
    else
      return @to_do_array - @completed_array
    end
    # Returns an updated list
  end
end