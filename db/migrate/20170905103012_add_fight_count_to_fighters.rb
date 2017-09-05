class AddFightCountToFighters < ActiveRecord::Migration[5.0]
  def change
    add_column :fighters, :fights_count, :integer
  end
end
