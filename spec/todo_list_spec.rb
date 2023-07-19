require('todo_list')

RSpec.describe ToDoList do
  let(:todo_list) { ToDoList.new }


  it "initializes with an empty array" do
    expect(todo_list.todos).to eq([]) 
  end

  it "can add a task to the todos array" do
    expect(todo_list.todos).to eq([]) 
    todo_list.add('wake up')
    expect(todo_list.todos).to eq(['wake up']) 
  end

  it "can add multipl tasks to the todos array" do
    expect(todo_list.todos).to eq([]) 
    todo_list.add('wake up')
    todo_list.add('go to sleep up')
    expect(todo_list.todos).to eq(['wake up', 'go to sleep up']) 
  end
end