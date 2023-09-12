require_relative 'book'
require_relative 'label_manager'



class BookManager
  def initialize()
    @books = []
    @labels = LabelManager.new
  end

  def list_all_books
    if @books == []
      puts 'No Books Yet, Create one first'
    else
      @books.map do |book|
        puts "Publish date: #{book.publish_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
      end
    end
  end

  def add_book(publish_date, publisher, cover_state, title, color)
    new_book = Book.new(publish_date, publisher, cover_state)
    @labels.add_label(title, color)
    @books << new_book
    puts "Book created successfully!
    Publish date: #{new_book.publish_date}, Publisher: #{new_book.publisher}, Cover State: #{new_book.cover_state}"
  end

  def list_all_labels
    @labels.list_labels
  end
end
