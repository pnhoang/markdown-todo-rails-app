class Todo < ActiveRecord::Base
  attr_accessible :item, :completed
  
  validates :item, presence: true
end
