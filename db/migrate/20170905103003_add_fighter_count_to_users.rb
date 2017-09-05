class AddFighterCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fighters_count, :integer
  end
end
