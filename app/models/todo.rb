class Todo < ActiveRecord::Base
  attr_accessible :item, :completed
  after_initialize :default_values
  
  validates :item, presence: true
  belongs_to :list
  
  private
    def default_values
      self.completed ||= false
    end
end
