class CreateMuseums < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :title
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
