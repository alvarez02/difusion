class ChgRemoveFk2 < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :comentarios, :expositors
  end
end
