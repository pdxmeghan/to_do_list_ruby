require 'rspec'
require 'task'
require 'list'

describe 'Task' do
  it 'is initialized with a description' do
    test_task = Task.new('read a Ruby book')
    test_task.should be_an_instance_of Task
  end

  it 'lets you read the description out' do
    test_task = Task.new('read a Ruby book')
    expect(test_task.description).to eq 'read a Ruby book'
  end

  it 'will give a priority number to each task' do
    test_list = List.new("Home")
    test_task = Task.new("sweep the kitchen")
    test_task.add_priority(1)
    expect(test_task.priority).to eq 1
  end
end

describe 'List' do
  it 'starts out with an empty list of tasks' do
    test_list = List.new("Home stuff")
    expect(test_list.tasks).to eq []
  end

  it 'can add tasks' do
    test_list = List.new("Home stuff")
    test_task = Task.new("sweep the kitchen")
    test_list.add_task(test_task)
    expect(test_list.tasks).to eq [test_task]
  end

  it 'will remove completed tasks and store them in array' do
    test_list = List.new("Home stuff")
    test_task = Task.new("sweep the kitchen")
    test_list.delete_task(test_task)
    expect(test_list.completed).to eq [test_task]
    expect(test_list.tasks).to eq []
  end

  it 'will sort the tasks by priority' do
    test_list = List.new("Home")
    one_task = Task.new("sweep")
    one_task.add_priority(1)
    two_task = Task.new("cook")
    two_task.add_priority(3)
    three_task = Task.new("clean")
    three_task.add_priority(2)
    test_list.add_task(one_task)
    test_list.add_task(three_task)
    test_list.add_task(two_task)
    expect(test_list.sorted_by_priority).to eq [one_task, three_task, two_task]
  end
end



