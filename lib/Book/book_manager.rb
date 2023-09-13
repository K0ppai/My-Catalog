require_relative 'book'
require_relative 'label_manager'

class BookManager
  def initialize()
    @books = []
    @labels = LabelManager.new
  end

  def list_all_books
    puts "\e[37m"
    if @books == []
      puts "📚 Oops! 😬 It seems we don't have books "
      puts "But don't worry, you can create your own! ✨  🖋️"
      puts 'Go ahead and add a book to your library 📖'
    else
      puts "\e[35m"
      puts 'Here is the Books List 📚'
      puts "\e[37m"
      @books.map do |book|
        puts "Publish date: #{book.publish_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
      end
    end
    puts "\e[34m"
  end

  def booklist
    @books
  end

  def add_book(publish_date, publisher, cover_state, title, color)
    new_book = Book.new(publish_date, publisher, cover_state)
    new_book.label = Label.new(title, color)
    @labels.add_label(new_book, title, color)
    @books << new_book
  end

  def list_all_labels
    @labels.list_labels
  end
end
