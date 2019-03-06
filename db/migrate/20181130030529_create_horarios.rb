class CreateHorarios < ActiveRecord::Migration[5.2]
  def change
    create_table :horarios do |t|
      t.integer :lunes
      t.integer :martes
      t.integer :miercoles
      t.integer :jueves
      t.integer :viernes
      t.integer :sabado
      t.integer :domingo

      t.timestamps
    end
  end
end
