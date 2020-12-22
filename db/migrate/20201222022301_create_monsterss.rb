class CreateMonsterss < ActiveRecord::Migration

  def change
    create_table :monsters do |t|
      t.string :species
      t.string :lore
      t.string :how_to_kill
    end
  end

end
