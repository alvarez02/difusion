class AddForeignKeyToActividadMaterial < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :actividad_materials, :actividads ,column: :actividad_id , primary_key: :id
    add_foreign_key :actividad_materials, :materials ,column: :material_id , primary_key: :id
  end
end
