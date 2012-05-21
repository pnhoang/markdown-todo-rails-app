class Todo < ActiveRecord::Base
  attr_accessible :completed_at, :item, :completed
  
  validates :item, presence: true
end
