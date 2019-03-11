class AddForeignKeyToActividadExpositor < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :activdad_expositors, :expositors ,column: :expositor_id , primary_key: :id
    add_foreign_key :activdad_expositors, :actividads ,column: :actividads_id , primary_key: :id
  end
end
