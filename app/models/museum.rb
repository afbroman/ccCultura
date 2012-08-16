class Museum < ActiveRecord::Base
  attr_accessible :address, :description, :title
  validates :title, presence: true
end
