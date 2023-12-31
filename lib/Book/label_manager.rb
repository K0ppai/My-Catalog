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
      puts 'Go ahead and add a label to your favorite book or music album. 📖  🎶'
    else
      puts "\e[35m"
      puts 'Here is the Labels List 🏷️ 📚'
      puts "\e[37m"
      @labels.map { |label| puts "\e[37m #{label.color}, #{label.title}\e[34m" }
    end
    puts "\e[34m"
  end

  def add_label(item, title, color)
    new_label = Label.new(title, color)
    new_label.add_item(item)
    @labels << new_label
  end
end
