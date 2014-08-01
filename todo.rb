require './lib/task'
require './lib/list'

def first_menu
  loop do
    puts "Press 'n' to create a new list."
    puts "Press 'p' to pick a list to view."
    puts "Press 'x' to exit."
    first_choice = gets.chomp
    if first_choice == 'n'
      new_list
    elsif first_choice == 'p'
      if List.all == []
        puts "Sorry! You have no lists. Please add a new list."
        puts "\n"
        first_menu
      else
        view_list
      end
    elsif first_choice == 'x'
      exit
    else
      puts "Pick a valid option, duh! \n\n"
      first_menu
    end
  end
end

def new_list
  puts "What is the name of your list?"
  list_name = gets.chomp
  List.new(list_name).save
  puts "List created!"
  puts "\n\n"
  first_menu
end

def view_list
  puts "Here are all your lists"
  List.all.each do |list|
    puts list.name
  end
  puts "\n\n"
  puts "Write the name of the list you would like to view."
  list_choice = gets.chomp
  List.all.each do |list|
    if list.name == list_choice
      @selected_list = list
      puts "\n\n"
      puts list.name
    end
  end
  puts "\n\n"
  task_menu
end

def task_menu
  loop do
    puts "Press 'a' to add a task to your list. Press 'd' to mark a task as done."
    puts "Press 'c' to see your completed tasks.  Press 'e' to edit a task.  Press 'r' to remove a task."
    puts "Press 'l' to see all of your tasks. Press 'f' to go to the first menu. Press 'x' to exit."
    task_choice = gets.chomp
    if task_choice == 'a'
      add_task
    elsif task_choice == 'd'
      mark_done
    elsif task_choice == 'l'
      list_tasks
    elsif task_choice == 'f'
      first_menu
    elsif task_choice == 'c'
      completed_list
    elsif task_choice == 'e'
      edit_task
    elsif task_choice == 'r'
      remove_task
    elsif task_choice == 'x'
      exit
    else
      puts "Please choose a valid option."
    end
  end
  puts "\n\n"
end

def add_task
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  new_task = Task.new(user_description)
  @selected_list.add_task(new_task)
  puts "Task added.\n\n"
  puts "What is the priority of this task on a scale of 1 to 5?"
  priority_number = gets.chomp
  new_task.add_priority(priority_number)
  puts "\n\n"
  task_menu
end

def list_tasks
  puts "Here are all of your tasks:"
  @selected_list.sorted_by_priority.each do |item|
    puts item.description
  end
  puts "\n"
  task_menu
end

def mark_done
  @selected_list.tasks.each do |item|
    puts item.description
  end
  puts "Write which item you'd like to mark as done."
  done_choice = gets.chomp
  @selected_list.tasks.each do |item|
    if done_choice == item.description
      @selected_list.delete_task(item)
    end
  end
  puts "Here is your list of things you've completed."
  @selected_list.completed.each do |item|
    puts item.description
  end
  puts "\n\n"
  task_menu
end

def completed_list
  puts "Here is your list of things you've completed."
  @selected_list.completed.each do |item|
    puts item.description
  end
  puts "\n\n"
  task_menu
end

def edit_task
  @selected_list.tasks.each do |item|
    puts item.description
  end
  puts "\n\n"
  puts "Which task would you like to edit?"
  edit_choice = gets.chomp
  @selected_list.tasks.each do |task|
    if task.description == edit_choice
      puts task.description
      @selected_task = task
    end
  end
  puts "Write the new description of your task"
  task_description = gets.chomp
  @selected_task.new_description(task_description)
  puts "\n\n"
  first_menu
end

def remove_task
  @selected_list.tasks.each do |item|
    puts item.description
  end
  puts "\n\n"
  remove_choice = gets.chomp
  @selected_list.tasks.each do |task|
    if task.description == remove_choice
      @selected_list.remove_task(task)
    end
  end
  puts "Your task has been deleted."
  puts "\n\n"
  task_menu
end

first_menu

