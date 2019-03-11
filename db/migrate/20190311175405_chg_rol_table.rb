class ChgRolTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :rols, :admin_user_id
    add_column :admin_users,   :rol_id, :integer
  end
end
