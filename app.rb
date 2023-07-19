class App
  def initialize(io)
    @io = io
    @todos = []
  end

  def run
    main_prompt = "What would you like to do?\n
      To add a todo: 'add [Todo name]'\n
      To mark a todo complete: 'done [Todo ID]'\n
      To see all todos: 'show todos'\n
      To exit: 'exit'"

    def print_todos
      @todos.each_with_index { |todo, index| @io.puts "#{todo}, ID: #{index + 1}"} 
    end
      
    while true
      @io.puts(main_prompt)
      answer = @io.gets
      case answer.split.first
      when 'add'
        todo_name = answer.split[1..-1].join(" ")
        @todos << todo_name
        @io.puts("todo added, ID #{@todos.length}")
        print_todos
      when 'done'
        todo_id = answer.split.last.to_i
        @todos.delete_at(todo_id - 1)
        if @todos.empty?
          @io.puts "no todos in list"
        else
          print_todos
        end
      else
        return
      end
    end
  end
end
