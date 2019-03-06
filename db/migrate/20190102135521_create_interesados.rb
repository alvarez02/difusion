class CreateInteresados < ActiveRecord::Migration[5.2]
  def change
    create_table :interesados do |t|
      t.string :nombre_interesado
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :rut
      t.string :comuna
      t.string :correo
      t.string :colegio
      t.string :curso
      t.string :carrera1
      t.string :carrera2
      t.string :carrera3
      t.string :carrera4

      t.timestamps
    end
  end
end
