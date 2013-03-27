class Book < ActiveRecord::Base
  attr_accessible :title, :genre_id, :author_ids, :review
  
  belongs_to :genre
  has_and_belongs_to_many :authors
  has_many :comments

  validates_length_of :title, :in => 1..50
  validates_uniqueness_of :title
  validates_presence_of :genre_id
end
