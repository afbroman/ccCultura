class Museum < ActiveRecord::Base
  attr_accessible :address, :description, :title, :region_id, :region
  validates :title, presence: true
  belongs_to :region

  def self.by_region
    all(include: :region).group_by(&:region_name)
  end

  # def region_name
  #   region.name
  # end

  delegate :name, to: :region, prefix: true, allow_nil: true

end
