class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.integer :wins
      t.string :pic
      t.string :first_name
      t.string :last_name
      t.integer :created_by
      t.integer :updated_by
      t.integer :losses
      t.integer :draws
      t.integer :no_contests

      t.timestamps

    end
  end
end
