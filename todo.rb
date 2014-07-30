require './lib/task'

@list = []
@done = []

def main_menu
  loop do
    puts "Press 'a' to add a task or 'l' to list all of your tasks."
    puts "Press 'd' to mark a task as done. Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'a'
      add_task
    elsif main_choice == 'l'
      list_tasks
    elsif main_choice == 'd'
      mark_done
    elsif main_choice == 'x'
      puts "Good-bye!"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add_task
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  @list << Task.new(user_description)
  puts "Task added.\n\n"
end

def list_tasks
  puts "Here are all of your tasks:"
  @list.each do |item|
    puts item.description
  end
  puts "\n"
end

def mark_done
  @list.each do |item|
    puts item.description
  end
  puts "Write which code you'd like to mark as done."
  done_choice = gets.chomp
  @list.each do |item|
    if done_choice == item.description
      @done << item.description
      @list.delete(item)
    end
  end
  puts "Here is your list of things you've completed."
  puts "#{@done}"
  "\n\n"
end

main_menu
