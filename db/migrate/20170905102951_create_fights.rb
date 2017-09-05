class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :fighter
      t.integer :fighter2
      t.integer :venue
      t.string :result
      t.date :date
      t.string :tagline
      t.integer :attendance
      t.string :poster

      t.timestamps

    end
  end
end
