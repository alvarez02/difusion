class CreateFalloExpositorActividads < ActiveRecord::Migration[5.2]
  def change
    create_table :fallo_expositor_actividads do |t|
      t.integer :fallo_expositor_id
      t.integer :expositor_id
      t.integer :actividad_id

      t.timestamps
    end
  end
end
