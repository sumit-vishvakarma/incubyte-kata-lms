Library Management System

Overview

This is a Library Management System implemented in Ruby. The system allows users to:

Add new books to the library.

Borrow books if they are available.

Return borrowed books.

View a list of available books.

Prerequisites

Ruby installed on your system.

Bundler gem installed (gem install bundler).

Setup Instructions

Clone the repository:

git clone <repository-url>
cd library-management-system

Install dependencies:

bundle install

Running Tests

This project uses RSpec for testing. To run the test suite:

Execute the following command:

bundle exec rspec

RSpec will run all the test cases and provide a detailed report of the results.

Features

Add Books: Add a new book to the library. Ensure the book has a unique ISBN.

Borrow Books: Borrow a book if it is available. If not, an error will be raised.

Return Books: Return a previously borrowed book to make it available again.

View Available Books: List all books currently available for borrowing.

Example Usage

Refer to the library.rb file for implementation details and spec/library_spec.rb for corresponding tests.

Commands

To add, borrow, or return books, modify the library.rb methods and rerun the tests to ensure functionality.

Use bundle exec rspec to verify any changes in functionality.

