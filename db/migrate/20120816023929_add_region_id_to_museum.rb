class AddRegionIdToMuseum < ActiveRecord::Migration
  def change
    add_column :museums, :region_id, :integer
  end
end
