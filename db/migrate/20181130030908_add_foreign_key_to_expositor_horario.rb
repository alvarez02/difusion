class AddForeignKeyToExpositorHorario < ActiveRecord::Migration[5.2]
  def change

    add_foreign_key :expositor_horarios, :expositors ,column: :expositor_id , primary_key: :id
    add_foreign_key :expositor_horarios, :horarios ,column: :horario_id , primary_key: :id

  end
end
