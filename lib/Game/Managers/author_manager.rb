require_relative '../author'

class AuthorManager
  def initialize
    @all_authors = []
  end

  def list_all_authors
    if @all_authors == []
      puts " Oops! 😬 It seems we don't have authors ✍️ "
      puts "But don't worry, you can create your own! ✨  🖋️"
      puts 'Go ahead and add a your game and author. 🎮'
    else
      puts "\e[35m"
      puts ' Here is the Author List ✍️'
      puts ''
      @all_authors.each do |author|
        puts "\e[37m First name: \"#{author.first_name}\", Last name: \"#{author.last_name}\""
      end
    end
    puts "\e[34m"
  end

  def add_author(item, first_name, last_name)
    author = Author.new(first_name, last_name)
    author.add_item(item)
    @all_authors << author
  end
end
