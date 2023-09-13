require_relative 'label'

class LabelManager
  def initialize
    @labels = []
  end

  def list_labels
    puts "\e[37m"
    if @labels == []
      puts "📚 Oops! 😬 It seems we don't have labels 🏷️"
       puts "But don't worry, you can be the label master and create your own! ✨  🖋️"
      puts "Go ahead and add a label to your favorite book or music album. 📖  🎶"
       puts "\e[34m"
    else 
     puts "\e[37m"
     puts 'Here is the Labels List'
     @labels.map { |label| puts "\e[37m #{label.color}, #{label.title}\e[34m" }
     puts "\e[34m"
    end
    
  end

  def add_label(title, color)
    new_label = Label.new(title, color)
    @labels << new_label
  end
end
