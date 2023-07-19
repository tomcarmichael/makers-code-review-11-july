require_relative('../app')

RSpec.describe App do

  it "Allows the user to add a todo, displays the todo and allows the user to exit" do
    io = double(:io)
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

    app = App.new(io)
    app.run  
  end

  it "Allows the user to add a different todo, displays the todo and allows the user to exit" do
    io = double(:io)
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

    app = App.new(io)
    app.run  
  end

  it "Allows the user to add multiple todos, displays them and allows the user to exit" do
    io = double(:io)
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

    app = App.new(io)
    app.run  
  end

  it "Allows the user to mark a todo complete" do
    io = double(:io)
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

    app = App.new(io)
    app.run  
  end
end