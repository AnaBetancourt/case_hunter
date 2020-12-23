class AddNameToCases < ActiveRecord::Migration

  def change
    add_column :cases, :name, :string
  end

end
