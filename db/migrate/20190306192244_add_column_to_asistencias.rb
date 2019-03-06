class AddColumnToAsistencias < ActiveRecord::Migration[5.2]
  def change
    add_column :asistencias, :justica, :boolean, default: false
    add_column :asistencias, :comentario, :text

  end
end
