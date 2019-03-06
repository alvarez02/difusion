class CreateActividadMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :actividad_materials do |t|
      t.integer :actividad_id
      t.integer :material_id

      t.timestamps
    end
  end
end
