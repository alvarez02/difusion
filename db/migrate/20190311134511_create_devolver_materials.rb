class CreateDevolverMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :devolver_materials do |t|
      t.integer :material_id
      t.integer :actividad_id
      t.integer :cantidad

      t.timestamps
    end
  end
end
