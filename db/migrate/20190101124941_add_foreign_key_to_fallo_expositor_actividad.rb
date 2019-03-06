class AddForeignKeyToFalloExpositorActividad < ActiveRecord::Migration[5.2]
  def change
  add_foreign_key :fallo_expositor_actividads, :expositors ,column: :expositor_id , primary_key: :id
  add_foreign_key :fallo_expositor_actividads, :actividads ,column: :actividad_id , primary_key: :id
  add_foreign_key :fallo_expositor_actividads, :fallo_expositors ,column: :fallo_expositors_id , primary_key: :id

  end
end
