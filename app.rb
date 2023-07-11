class App
  def initialize(io)
    @io = io
  end

  def run
    main_prompt = "What would you like to do?\n
      To add a todo: 'add [Todo name]'\n
      To mark a todo complete: 'done [Todo ID]'\n
      To see all todos: 'show todos'\n
      To exit: 'exit'"
      
    while true
      @io.puts(main_prompt)
      answer = @io.gets
      case answer.split.first
      when 'add'
        todo_name = answer.split.last
        @io.puts("todo added, ID 1")
        @io.puts("#{todo_name}, ID: 1")
      when 'done'
        todo_id = answer.split.last
        @io.puts("no todos in list")
      else
        return
      end
    end
  end
end
