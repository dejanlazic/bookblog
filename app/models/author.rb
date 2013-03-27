class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_and_belongs_to_many :books
  
  validates_length_of :first_name, :in => 1..30
  validates_length_of :last_name, :in => 1..30
  
  def name
    "#{first_name} #{last_name}"
  end
end
