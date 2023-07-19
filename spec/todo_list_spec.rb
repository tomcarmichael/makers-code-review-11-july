require('todo_list')

RSpec.describe ToDoList do
  let(:todo_list) { ToDoList.new }

  it "initializes with an empty array" do
    expect(todo_list.todos).to eq([]) 
  end
end