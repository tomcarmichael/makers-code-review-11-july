require_relative('./lib/todo_list.rb')

class App
  def initialize(io, todo_list_class)
    @io = io
    @todo_list = todo_list_class.new
  end

  def run
    main_prompt = "What would you like to do?\n
      To add a todo: 'add [Todo name]'\n
      To mark a todo complete: 'done [Todo ID]'\n
      To see all todos: 'show todos'\n
      To exit: 'exit'"

    def print_todos
      @todo_list.todos.each_with_index { |todo, index| @io.puts "#{todo}, ID: #{index + 1}"} 
    end
      
    while true
      @io.puts(main_prompt)
      answer = @io.gets
      case answer.split.first
      when 'add'
        todo_name = answer.split[1..-1].join(" ")
        @io.puts(@todo_list.add(todo_name))
        print_todos
      when 'done'
        todo_id = answer.split.last.to_i
        @todo_list.delete(todo_id)
        if @todo_list.todos.empty?
          @io.puts "no todos in list"
        else
          print_todos
        end
      when 'exit'
        return
      end
    end
  end
end
