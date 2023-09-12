require_relative '../author'

class AuthorManager
  def initialize
    @all_authors = []
  end

  def list_all_authors
    @all_authors.each do |author|
      puts "First name: \"#{author.first_name}\", Last name: \"#{author.last_name}\""
    end
  end

  def add_author(item, first_name, last_name)
    author = Author.new(first_name, last_name)
    author.add_item(item)
    @all_authors << author
  end
end
