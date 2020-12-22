class CreateCases < ActiveRecord::Migration

  def change
    create_table :cases do |t|
      t.string :location
      t.string :description
      t.integer :hunter1_id
      t.integer :hunter2_id
      t.integer :monster_id
    end
  end

end
