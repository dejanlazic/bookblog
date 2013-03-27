require 'test_helper'
# require File.dirname(__FILE__) + '/../test_helper'
# ruby test/unit/book_test.rb

class BookTest < ActiveSupport::TestCase
 def test_failing_create
 book = Book.new

 assert_equal false, book.save
 assert_equal 7, book.errors.size
 assert book.errors.on(:title)
 assert book.errors.on(:author)
 assert book.errors.on(:genre)
end

fixtures :authors, :genres, :books

def test_create
 book = Book.new(:title => 'Ruby for Toddlers', :genre_id => Genre.find(1).id, :authors => Author.find(1))
 assert book.save
end

def test_has_many_and_belongs_to_mapping
 crime = Genre.find_by_name("Crime")
 assert_equal 2, crime.books.size

 book = Book.new(:title => 'Rails E-Commerce 3nd Edition', :authors => [Author.find_by_first_name_and_last_name('Christian', 'Hellsten'),
 Author.find_by_first_name_and_last_name('Jarkko', 'Laine')])

 crime.books << book

 crime.reload
 book.reload

 assert_equal 3, crime.books.size
 assert_equal 'Crime', book.genre.name
end

end
