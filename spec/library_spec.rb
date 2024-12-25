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
end
