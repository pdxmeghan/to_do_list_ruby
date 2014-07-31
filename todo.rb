require './lib/task'
require './lib/list'

@list = []
@done = []
@list_of_lists = []

def first_menu
  loop do
    puts "Press 'n' to create a new list."
    puts "Press 'p' to pick a list to view."
    puts "Press 'x' to exit."
    first_choice = gets.chomp
    if first_choice == 'n'
      new_list
    elsif first_choice == 'p'
      view_list
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
  new_list = List.new(list_name)
  puts "List created!"
  @list_of_lists << new_list
  puts "\n\n"
  first_menu
end

def view_list
  puts "Here are all your lists"
  @list_of_lists.each do |list|
    puts list.name
  end
  puts "\n\n"
  puts "Write the name of the list you would like to edit."
  list_choice = gets.chomp
  @list_of_lists.each do |list|
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
  task_menu
end

def list_tasks
  puts "Here are all of your tasks:"
  @selected_list.tasks.each do |item|
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

first_menu

