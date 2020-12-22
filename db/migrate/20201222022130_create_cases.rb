class CreateCases < ActiveRecord::Migration

  def change
    create_table :cases do |t|
      t.string :location
      t.string :description
      t.integer :hunter_id
      t.integer :monster_id
    end
  end

end
