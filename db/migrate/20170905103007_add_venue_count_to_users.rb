class AddVenueCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :venues_count, :integer
  end
end
