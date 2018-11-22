class CreateExpositors < ActiveRecord::Migration[5.2]
  def change
    create_table :expositors do |t|
      t.string :nombre_expositor
      t.string :rut
      t.string :telefono
      t.string :carrera
      t.integer :anio_ingreso

      t.timestamps
    end
  end
end
