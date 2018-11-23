class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :nombre_material
      t.integer :cantidad

      t.timestamps
    end
  end
end
