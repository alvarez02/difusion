class AddColumnJornadaToActividads < ActiveRecord::Migration[5.2]
  def change
    add_column :actividads, :jornada, :string
  end
end
