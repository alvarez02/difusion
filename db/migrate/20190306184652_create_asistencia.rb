class CreateAsistencia < ActiveRecord::Migration[5.2]
  def change
    create_table :asistencias do |t|
      t.integer :expositor_id
      t.integer :actividad_id
      t.time :fecha
      t.boolean :asistencia, default: true

      t.timestamps
    end
  end
end
