# File: spec/serch_tool_spec.rb

require 'todo_entry'

describe TodoEntry do
  context 'when no tasks have been added' do
    it 'returns an empty list' do
      new_list = TodoEntry.new
      expect(new_list.todos).to eq []
    end
  end
  context 'when a  task has been added' do
    it 'returns a list' do
      new_list = TodoEntry.new
      new_list.add("vacuum")
      expect(new_list.todos).to eq ["vacuum"]
    end
  end
  context 'when multiple tasks have been added' do
    it 'returns a list' do
      new_list = TodoEntry.new
      new_list.add("vacuum")
      new_list.add("clean")
      new_list.add("sweep")
      expect(new_list.todos).to eq ["vacuum", "clean", "sweep"]
    end
  end
end