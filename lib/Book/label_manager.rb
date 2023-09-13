require_relative 'label'

class LabelManager
  def initialize
    @labels = []
  end

  def list_labels
    puts 'No Labels yet, create one first' if @labels == []
    @labels.map { |label| puts "#{label.color}, #{label.title}" }
  end

  def add_label(title, color)
    new_label = Label.new(title, color)
    @labels << new_label
  end
end
