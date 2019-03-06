class ChgNameColumnJusticaToAsistencias < ActiveRecord::Migration[5.2]
  def change
    rename_column :asistencias , :justica , :justifica
  end
end
