class AddFechaToActividad < ActiveRecord::Migration[5.2]
  def change
    add_column :actividads, :fecha, :date
  end
end
