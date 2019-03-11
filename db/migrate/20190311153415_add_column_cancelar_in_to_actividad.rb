class AddColumnCancelarInToActividad < ActiveRecord::Migration[5.2]
  def change
    add_column :actividads, :cancelar, :boolean, default: false
  end
end
