class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :city
      t.string :state
      t.string :name
      t.string :country
      t.integer :capacity
      t.integer :created_by
      t.string :pic
      t.integer :updated_by

      t.timestamps

    end
  end
end
