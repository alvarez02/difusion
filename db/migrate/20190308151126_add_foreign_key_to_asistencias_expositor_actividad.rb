class AddForeignKeyToAsistenciasExpositorActividad < ActiveRecord::Migration[5.2]
  def change

    add_foreign_key :asistencias, :expositors ,column: :expositor_id , primary_key: :id
    add_foreign_key :asistencias, :actividads ,column: :actividad_id , primary_key: :id
  end
end
