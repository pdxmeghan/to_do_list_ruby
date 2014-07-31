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
end
