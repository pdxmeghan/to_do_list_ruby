class Task
  def initialize(description)
    @description = description
    @priority = 0
  end

  def description
    @description
  end

  def priority
    @priority
  end

  def add_priority(number)
    @priority += number.to_i
  end

  def new_description(new_descrip)
    @description = new_descrip
  end
end
