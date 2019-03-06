class CreateExpositorHorarios < ActiveRecord::Migration[5.2]
  def change
    create_table :expositor_horarios do |t|
      t.integer :expositor_id
      t.integer :horario_id

      t.timestamps
    end
  end
end
