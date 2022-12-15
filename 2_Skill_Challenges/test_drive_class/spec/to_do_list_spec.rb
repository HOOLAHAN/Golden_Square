# File: spec/to_do_list_rspec.rb

require 'to_do_list.rb'

describe 'task list method' do
  it 'adds task to list and returns list' do
    add_task = ToDo.new
    result = add_task.task_list("Vacuum")
    expect(result).to eq ["Vacuum"]
  end
  it 'adds more than one task to list and returns list' do
    add_task = ToDo.new
    add_task.task_list("Vacuum")
    result = add_task.task_list("Dishes")
    expect(result).to eq ["Vacuum", "Dishes"]
  end
  it 'provides message if item is already on list' do
    add_task = ToDo.new
    add_task.task_list("Vacuum")
    result = add_task.task_list("Vacuum")
    expect(result).to eq "Item already on list"
  end
end

describe 'completed task method' do
  it 'removes task from list and returns list' do
    add_task = ToDo.new
    add_task.task_list("Dishes")
    add_task.task_list("Vacuum")
    result = add_task.completed_task("Vacuum")
    expect(result).to eq ["Dishes"]
  end
  it 'provides message if to do list is empty' do
    add_task = ToDo.new
    add_task.task_list("Dishes")
    result = add_task.completed_task("Dishes")
    expect(result).to eq "Empty to-do list"
  end
  it 'provides message if item is not on list' do
    add_task = ToDo.new
    add_task.task_list("Vacuum")
    result = add_task.completed_task("Dishes")
    expect(result).to eq "Item not on list"
  end
  it 'list continues to work after incorrect item has been called completed' do
    add_task = ToDo.new
    add_task.task_list("Vacuum")
    add_task.completed_task("Dishes")
    result = add_task.task_list("Bins")
    expect(result).to eq ["Vacuum", "Bins"]
  end
end