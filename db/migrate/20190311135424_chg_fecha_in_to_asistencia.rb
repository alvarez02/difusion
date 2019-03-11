class ChgFechaInToAsistencia < ActiveRecord::Migration[5.2]
  def change
    change_column :actividads, :fecha, :datetime
  end
end
