require_relative './book'

class Book_Manager
  def initialize()
    @books = []
    @labels = []
  end

  def list_all_books
    if @books == []
      puts 'No Books Yet, Create one first'
    else
      @books.map {|book| puts "Publish date: #{book.publish_date},
      Publisher: #{book.publisher}, Cover State: #{book.cover_state}"}
    end
  end

  def add_book(publish_date, publisher, cover_state)
    new_book = Book.new(publish_date, publisher, cover_state)
    @books << new_book
    puts "Book created successfully! Publish date: #{new_book.publish_date},
    Publisher: #{new_book.publisher}, Cover State: #{new_book.cover_state}"
  end
  
end