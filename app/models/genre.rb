class Genre < ActiveRecord::Base
  attr_accessible :name

  has_many :books

  validates_length_of :name, :in => 1..30
  validates_uniqueness_of :name
end
