require_relative('../app')
require('todo_list')


RSpec.describe App do
  let(:io) { double(:io) }
  let(:app) { App.new(io, ToDoList) }


  it "Allows the user to add a todo, displays the todo and allows the user to exit" do
    main_prompt = "What would you like to do?\n
      To add a todo: 'add [Todo name]'\n
      To mark a todo complete: 'done [Todo ID]'\n
      To see all todos: 'show todos'\n
      To exit: 'exit'"
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('add wakeup').ordered
    expect(io).to receive(:puts).with('todo added, ID 1').ordered
    expect(io).to receive(:puts).with('wakeup, ID: 1').ordered
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('exit').ordered
    app.run  
  end

  it "Allows the user to add a todo with multiple words" do
    main_prompt = "What would you like to do?\n
      To add a todo: 'add [Todo name]'\n
      To mark a todo complete: 'done [Todo ID]'\n
      To see all todos: 'show todos'\n
      To exit: 'exit'"
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('add brush the dog').ordered
    expect(io).to receive(:puts).with('todo added, ID 1').ordered
    expect(io).to receive(:puts).with('brush the dog, ID: 1').ordered
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('exit').ordered
    app.run  
  end

  it "Allows the user to add a different todo, displays the todo and allows the user to exit" do
    main_prompt = "What would you like to do?\n
      To add a todo: 'add [Todo name]'\n
      To mark a todo complete: 'done [Todo ID]'\n
      To see all todos: 'show todos'\n
      To exit: 'exit'"
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('add sleep').ordered
    expect(io).to receive(:puts).with('todo added, ID 1').ordered
    expect(io).to receive(:puts).with('sleep, ID: 1').ordered
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('exit').ordered
    app.run  
  end

  it "Allows the user to add multiple todos, displays them and allows the user to exit" do
    main_prompt = "What would you like to do?\n
      To add a todo: 'add [Todo name]'\n
      To mark a todo complete: 'done [Todo ID]'\n
      To see all todos: 'show todos'\n
      To exit: 'exit'"
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('add sleep').ordered
    expect(io).to receive(:puts).with('todo added, ID 1').ordered
    expect(io).to receive(:puts).with('sleep, ID: 1').ordered
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('add wakeup').ordered
    expect(io).to receive(:puts).with('todo added, ID 2').ordered
    expect(io).to receive(:puts).with("sleep, ID: 1").ordered
    expect(io).to receive(:puts).with("wakeup, ID: 2").ordered
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('exit').ordered
    app.run  
  end

  it "Allows the user to mark a todo complete" do
    main_prompt = "What would you like to do?\n
      To add a todo: 'add [Todo name]'\n
      To mark a todo complete: 'done [Todo ID]'\n
      To see all todos: 'show todos'\n
      To exit: 'exit'"
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('add sleep').ordered
    expect(io).to receive(:puts).with('todo added, ID 1').ordered
    expect(io).to receive(:puts).with('sleep, ID: 1').ordered
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('done 1').ordered
    expect(io).to receive(:puts).with('no todos in list').ordered
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('exit').ordered
    app.run  
  end

  it "Allows the user to add multiple todos and mark one of them done" do
    main_prompt = "What would you like to do?\n
      To add a todo: 'add [Todo name]'\n
      To mark a todo complete: 'done [Todo ID]'\n
      To see all todos: 'show todos'\n
      To exit: 'exit'"
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('add sleep').ordered
    expect(io).to receive(:puts).with('todo added, ID 1').ordered
    expect(io).to receive(:puts).with('sleep, ID: 1').ordered
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('add wakeup').ordered
    expect(io).to receive(:puts).with('todo added, ID 2').ordered
    expect(io).to receive(:puts).with("sleep, ID: 1").ordered
    expect(io).to receive(:puts).with("wakeup, ID: 2").ordered
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('done 1').ordered
    expect(io).to receive(:puts).with('wakeup, ID: 1').ordered
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('exit').ordered
    app.run  
  end

  it "Prompts the user again if they enter an unrecognised command" do
    main_prompt = "What would you like to do?\n
      To add a todo: 'add [Todo name]'\n
      To mark a todo complete: 'done [Todo ID]'\n
      To see all todos: 'show todos'\n
      To exit: 'exit'"
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('sleep').ordered
    expect(io).to receive(:puts).with(main_prompt).ordered
    expect(io).to receive(:gets).and_return('exit').ordered
    app.run  
  end
end