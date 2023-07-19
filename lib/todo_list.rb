class ToDoList
  attr_accessor :todos

  def initialize
    @todos = []
  end

  def add(task)
    @todos << task
    return "todo added, ID #{@todos.length}"
  end

  def delete(id)
    @todos.delete_at(id - 1)
  end

  
end
