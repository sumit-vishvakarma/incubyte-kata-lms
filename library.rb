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

	def borrow_book(isbn)
		book = @books.find { |b| b[:isbn] == isbn }
		raise 'Book not found' unless book
		raise 'Book is already borrowed' unless book[:available]

		book[:available] = false
	end
end
