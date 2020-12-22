class CreateHunters < ActiveRecord::Migration

  def change
    create_table :hunters do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :username
      t.string :password_digest
    end
  end

end
