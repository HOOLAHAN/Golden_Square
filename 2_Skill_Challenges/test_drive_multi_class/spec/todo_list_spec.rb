# File: spec/todo_list_rspec.rb

require 'todo_list.rb'

describe TodoList do
  context 'when no tasks have been added' do
    it 'returns an empty list' do
      new_list = TodoList.new
      expect(new_list.incomplete).to eq []
    end
  end
end
