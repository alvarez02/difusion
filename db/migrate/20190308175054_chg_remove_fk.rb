class ChgRemoveFk < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :comentarios, :actividads
end
  end
