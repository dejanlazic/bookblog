class Comment < ActiveRecord::Base
  attr_accessible :book_id, :text, :user_id
  
  belongs_to :book
  belongs_to :user
  
  validates_presence_of :book_id
  #validates_presence_of :user_id
end
