# spec/library_spec.rb

require_relative '../library'

RSpec.describe Library do
  let(:library) { Library.new }

  describe '#add_book' do
    let(:book) { { isbn: '12345', title: 'Ruby 101', author: 'John Doe', year: 2021 } }

    it 'adds a book to the library' do
      library.add_book(book)
      expect(library.books.size).to eq(1)
      expect(library.books.first[:title]).to eq('Ruby 101')
    end

    it 'raises an error when adding a duplicate book' do
      library.add_book(book)
      expect { library.add_book(book) }.to raise_error('Book already exists')
    end
  end
	
	describe '#borrow_book' do
		let(:book) { { isbn: '12345', title: 'Ruby 101', author: 'John Doe', year: 2021 } }

		before do
			library.add_book(book)
		end

		it 'marks a book as unavailable when borrowed' do
			library.borrow_book('12345')
			expect(library.books.first[:available]).to be(false)
		end

		it 'raises an error if the book is already borrowed' do
			library.borrow_book('12345')
			expect { library.borrow_book('12345') }.to raise_error('Book is already borrowed')
		end

		it 'raises an error if the book does not exist' do
			expect { library.borrow_book('67890') }.to raise_error('Book not found')
		end
	end

end
