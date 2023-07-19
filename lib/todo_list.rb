class ToDoList
  attr_accessor :todos

  def initialize
    @todos = []
  end

  def add(task)
    @todos << task
  end
end
