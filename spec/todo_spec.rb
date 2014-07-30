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
end

describe 'List' do
  it 'starts out with an empty list of tasks' do
    test_list = List.new("Home stuff")
    expect(test_list.tasks).to eq []
  end
end

