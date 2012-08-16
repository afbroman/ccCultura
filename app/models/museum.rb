class Museum < ActiveRecord::Base
  attr_accessible :address, :description, :title, :region_id, :region
  validates :title, presence: true
  belongs_to :region

  def self.by_region
    all(include: :region).group_by(&:region)
  end
end
