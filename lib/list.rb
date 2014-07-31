class List
  def initialize(name)
    @name = name
    @tasks = []
    @completed = []
  end

  def name
    @name
  end

  def tasks
    @tasks
  end

  def completed
    @completed
  end

  def add_task(task)
    @tasks << task
  end

  def delete_task(task)
    @completed << task
    @tasks.delete(task)
  end

  def remove_task(task)
    @tasks.delete(task)
  end

  def sorted_by_priority
    sorted_array = @tasks.sort_by {|task| task.priority}
    sorted_array
  end

end
