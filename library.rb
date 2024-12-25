# library.rb

class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_book(book)
    raise 'Book already exists' if @books.any? { |b| b[:isbn] == book[:isbn] }

    @books << book.merge({ available: true })
  end
end
