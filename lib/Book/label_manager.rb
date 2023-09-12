
class Label_Manager
  def initialize()
    @labels = []
  end

  def list_labels
    puts "No Labels yet, create one first" if @labels == []

    @labels.map { |label| puts "#{label.color}, #{label.title}"}
  end
end