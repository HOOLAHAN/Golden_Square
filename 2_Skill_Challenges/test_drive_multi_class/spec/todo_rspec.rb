# File: spec/todo_rspec.rb

require 'todo.rb'

describe Todo do
  context 'given a task as string input' do
    it 'constructs' do
      new_item = Todo.new("task1")
      expect(new_item.task).to eq "task1"
    end
  end
  context 'given an empty string input' do
    it 'returns an empty string' do
      new_item = Todo.new("")
      expect(new_item.task).to eq ""
    end
  end
end
