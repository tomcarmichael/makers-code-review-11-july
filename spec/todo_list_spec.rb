require('todo_list')

RSpec.describe ToDoList do
  let(:todo_list) { ToDoList.new }


  it "initializes with an empty array" do
    expect(todo_list.todos).to eq([]) 
  end

  it "can add a task to the todos array" do
    expect(todo_list.todos).to eq([]) 
    expect(todo_list.add('wake up')).to eq('todo added, ID 1')
    expect(todo_list.todos).to eq(['wake up']) 
  end

  it "can add multiple tasks to the todos array" do
    todo_list.add('wake up')
    expect(todo_list.add('go to sleep')).to eq('todo added, ID 2')
    expect(todo_list.todos).to eq(['wake up', 'go to sleep'])
  end

  it "can delete a task from the todos array" do
    todo_list.add('wake up')
    todo_list.add('go to sleep')
    todo_list.delete(2)
    expect(todo_list.todos).to eq(['wake up'])
  end

  it "can delete a task from the middle of the todos array" do
    todo_list.add('wake up')
    todo_list.add('go to sleep')
    todo_list.add('walk the dog')
    todo_list.add('tell a joke')
    todo_list.delete(3)
    expect(todo_list.todos).to eq(['wake up', 'go to sleep', 'tell a joke'])
  end

end