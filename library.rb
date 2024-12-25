require 'json'

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

  def return_book(isbn)
    book = @books.find { |b| b[:isbn] == isbn }
    raise 'Book not found' unless book

    book[:available] = true
  end

  def view_available_books
    @books.select { |b| b[:available] }
  end

  def load_books_from_json(file_path)
    data = JSON.parse(File.read(file_path), symbolize_names: true)
    data.each { |book| add_book(book) }
  end
end

if __FILE__ == $PROGRAM_NAME
  library = Library.new

  # Load books from the JSON file
  library.load_books_from_json('books.json')

  loop do
    puts "\nLibrary Management System"
    puts "1. View Available Books"
    puts "2. Add a Book"
    puts "3. Borrow a Book"
    puts "4. Return a Book"
    puts "5. Exit"
    print "Enter your choice: "

    choice = gets.chomp.to_i

    case choice
    when 1
      puts "\nAvailable Books:"
      library.view_available_books.each do |book|
        puts "ISBN: #{book[:isbn]}, Title: #{book[:title]}, Author: #{book[:author]}, Year: #{book[:year]}"
      end
    when 2
      print "Enter ISBN: "
      isbn = gets.chomp
      print "Enter Title: "
      title = gets.chomp
      print "Enter Author: "
      author = gets.chomp
      print "Enter Year: "
      year = gets.chomp.to_i

      begin
        library.add_book({ isbn: isbn, title: title, author: author, year: year })
        puts "Book added successfully!"
      rescue => e
        puts e.message
      end
    when 3
      print "Enter ISBN to borrow: "
      isbn = gets.chomp

      begin
        library.borrow_book(isbn)
        puts "Book borrowed successfully!"
      rescue => e
        puts e.message
      end
    when 4
      print "Enter ISBN to return: "
      isbn = gets.chomp

      begin
        library.return_book(isbn)
        puts "Book returned successfully!"
      rescue => e
        puts e.message
      end
    when 5
      puts "Exiting the system. Goodbye!"
      break
    else
      puts "Invalid choice, please try again."
    end
  end
end
