class Museum < ActiveRecord::Base
  attr_accessible :address, :description, :title, :region_id, :region
  validates :title, presence: true
  belongs_to :region

  def self.by_region(search=nil)
    query = if search 
      where("title LIKE ?", "%#{search}%")
    else
      unscoped
    end
    query.all(include: :region).group_by(&:region_name)
  end

  # def region_name
  #   region.name
  # end

  delegate :name, to: :region, prefix: true, allow_nil: true

end
