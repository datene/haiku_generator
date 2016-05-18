require_relative 'haiku_repository'

# CLASS VIEW DISPLAYS USER INPUT RELATED OPTIONS
class View
  def display_haikus(haikus)
    haikus.each_with_index do |haiku, index|
      puts "#{index + 1}.\n #{haiku.title}: \n\n #{haiku.body[0]}\n\n #{haiku.body[1]} "
      puts "\n\n"
    end
  end


  def remove_haiku
    puts '------------------------------------------------------------------'
    puts 'Which haiku would you like to remove?'
    gets.chomp.to_i - 1
  end

  def search
    puts 'Enter your first word or sentence'
    puts '------------------------------------------------------------------'
    puts "\n"
    first = gets.chomp
    puts "\n"
    puts 'Enter your second word or sentence'
    puts '------------------------------------------------------------------'
    puts "\n"
    second = gets.chomp
    puts "\n"
    [first, second]
  end

  def display_result(title, body)
    print `clear`
    puts "\n\n\n"
    puts "#{title}:"
    puts "\n"
    puts "#{body[0]}"
    puts "\n"
    puts "#{body[1]}"
    puts "\n\n\n"
    add_result
  end

  def add_result
    puts '------------------------------------------------------------------'
    puts 'Would you like to add this haiku to your entries? (y/n)'
    choice = gets.chomp
    return_choice = (choice == 'y' ? true : false)
    print `clear`
    return_choice
  end
end
