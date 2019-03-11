class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.integer :expositor_id
      t.integer :actividad_id
      t.time :fecha
      t.text :comentario

      t.timestamps
    end
  end
end
