class CreateActividads < ActiveRecord::Migration[5.2]
  def change
    create_table :actividads do |t|
      t.string :nombre_feria
      t.string :nombre_colegio
      t.string :direccion
      t.string :comuna
      t.string :contacto_colegio
      t.integer :numero_expositores
      t.time :hora_inicio
      t.time :hora_termino

      t.timestamps
    end
  end
end
