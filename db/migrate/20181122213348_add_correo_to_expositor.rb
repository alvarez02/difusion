class AddCorreoToExpositor < ActiveRecord::Migration[5.2]
  def change
    add_column :expositors, :correo, :string
  end
end
