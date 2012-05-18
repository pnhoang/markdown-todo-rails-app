class Todo < ActiveRecord::Base
  attr_accessible :completed_at, :item
  
  validates :item, presence: true
end
