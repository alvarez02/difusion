class AddColumnToExpositors < ActiveRecord::Migration[5.2]
  def change
    add_column :expositors , :estado, :string
  end
end
