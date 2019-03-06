class ChgTableHorararios < ActiveRecord::Migration[5.2]
  def change
    remove_column :horarios, :lunes
    remove_column :horarios, :martes
    remove_column :horarios, :miercoles
    remove_column :horarios, :jueves
    remove_column :horarios, :viernes
    remove_column :horarios, :sabado
    remove_column :horarios, :domingo

    add_column :horarios, :dia, :string
    add_column :horarios, :horario, :string
  end
end
