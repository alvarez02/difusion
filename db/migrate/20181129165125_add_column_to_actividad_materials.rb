class AddColumnToActividadMaterials < ActiveRecord::Migration[5.2]
  def change
add_column :actividad_materials , :cantidad, :integer, default: 0
  end
end
