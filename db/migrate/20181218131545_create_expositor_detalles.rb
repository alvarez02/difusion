class CreateExpositorDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :expositor_detalles do |t|
      t.integer :expositor_id
      t.integer :aceptados
      t.integer :rechazados
      t.integer :fallos

      t.timestamps
    end
  end
end
