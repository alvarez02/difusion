class AddColumnToActividads < ActiveRecord::Migration[5.2]
  def change
    add_column :actividads , :transporte, :string
  end
end
