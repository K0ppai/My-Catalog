class Main

def run
  loop do
    display_options
    number = gets.chomp.to_i
    exit if number == 13
    execute(number)
  end
end

def display_options
  puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List of games'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - List all sources'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - Exit'
end

def exit
  puts "Thank you for using this app"
end

def execute number
  case number
  when 1
     puts '1 - List all books'
  when 2
    puts '2 - List all music albums'
  when 3
 puts '3 - List all movies'
  when 4
   puts '4 - List of games'
  when 5
   puts '5 - List all genres'
  when 6
   puts '6 - List all labels'
  when 7
   puts '7 - List all authors'
  when 8
  puts '8 - List all sources'
  when 9
puts '9 - Add a book'
  when 10
   puts '10 - Add a music album'
  when 11
  puts '11 - Add a movie'
  when 12
 puts '12 - Add a game'
  else
    puts "Enter valid number"
  end
end

end

main = Main.new
main.run