class AddForeignKeyToComentarioActividadExpositorSala < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :comentarios, :expositors ,column: :expositor_id , primary_key: :id
    add_foreign_key :comentarios, :actividads ,column: :actividad_id , primary_key: :id
  end
end
