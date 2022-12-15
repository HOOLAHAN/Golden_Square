# File: spec/todo_todo_list_rspec.rb

require 'todo_list.rb'
require 'todo.rb'

describe 'add method behaviour' do
  context 'when a task is created it is added to a list' do
    it 'adds the task to a list' do
      new_task = Todo.new("task1")
      new_list = TodoList.new
      result = new_list.add(new_task)
      expect(result).to eq [new_task]
    end
  end
end

describe 'incomplete method behaviour' do
  context 'given a to-do list' do
    it 'returns the incomplete items on the list' do
      new_list = TodoList.new
      new_task1 = Todo.new("task1")
      new_task2 = Todo.new("task2")
      new_list.add(new_task1)
      new_list.add(new_task2)
      expect(new_list.incomplete).to eq [new_task1, new_task2]
    end
  end
  context 'when a task has been marked complete' do
    it 'removes the task from the list and just shows incomplete tasks' do
      new_list = TodoList.new
      new_task1 = Todo.new("task1")
      new_task2 = Todo.new("task2")
      new_list.add(new_task1)
      new_list.add(new_task2)
      new_task1.mark_done!
      expect(new_list.incomplete).to eq [new_task2]
    end
  end
  context 'when all tasks have been marked complete' do
    it 'returns an empty list' do
      new_list = TodoList.new
      new_task1 = Todo.new("task1")
      new_task2 = Todo.new("task2")
      new_list.add(new_task1)
      new_list.add(new_task2)
      new_task1.mark_done!
      new_task2.mark_done!
      expect(new_list.incomplete).to eq []
    end
  end
end

describe 'complete method behaviour' do
  context 'when a task has been marked complete' do
    it 'is returned on in the completed list' do
      new_list = TodoList.new
      new_task1 = Todo.new("task1")
      new_task2 = Todo.new("task2")
      new_list.add(new_task1)
      new_list.add(new_task2)
      new_task1.mark_done!
      expect(new_list.complete).to eq [new_task1]
    end
  end
  context 'when no tasks have been marked complete' do
    it 'is returns an empty list' do
      new_list = TodoList.new
      new_task1 = Todo.new("task1")
      new_list.add(new_task1)
      expect(new_list.complete).to eq []
    end
  end
end

describe 'done method' do
  context 'when a task includes Done:' do
    it 'returns true' do
      new_list = TodoList.new
      new_task1 = Todo.new("task1")
      new_task1.mark_done!
      expect(new_task1.done?).to eq true
    end
  end
  context 'when a task does not include Done:' do
    it 'returns true' do
      new_list = TodoList.new
      new_task1 = Todo.new("task1")
      expect(new_task1.done?).to eq false
    end
  end
end

describe 'give_up method' do
  context 'when called on the incomplete list' do
    it 'returns them marked complete' do
      new_list = TodoList.new
      new_task1 = Todo.new("task1")
      new_task2 = Todo.new("task2")
      new_list.add(new_task1)
      new_list.add(new_task2)
      new_list.give_up!
      expect(new_list.complete).to eq [new_task1, new_task2]
    end
  end
end