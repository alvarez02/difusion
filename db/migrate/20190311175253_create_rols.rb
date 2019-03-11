class CreateRols < ActiveRecord::Migration[5.2]
  def change
    create_table :rols do |t|
      t.string :nombre
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
