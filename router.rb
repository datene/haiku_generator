# CLASS ROUTER INITIALIZES APPLICATION LOOP
class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts 'Welcome to Ruby Haiku'
    puts '           --           '

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.api_haiku_create
    when 2 then @controller.index
    when 3 then @controller.destroy
    when 4 then stop
    else
      puts 'Please press 1, 2, 3 or 4'
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ''
    puts 'What do you want to do next?'
    puts '1 - Create a haiku'
    puts '2 - List all saved haikus'
    puts '3 - Delete a haiku'
    puts '4 - Stop and exit the program'
    puts "\n\n\n"
  end
end
