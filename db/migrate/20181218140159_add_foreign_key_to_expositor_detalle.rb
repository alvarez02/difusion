class AddForeignKeyToExpositorDetalle < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :expositor_detalles, :expositors ,column: :expositor_id , primary_key: :id
  end
end
