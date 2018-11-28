class CreateActivdadExpositors < ActiveRecord::Migration[5.2]
  def change
    create_table :activdad_expositors do |t|
      t.integer :actividad_id
      t.integer :expositor_id

      t.timestamps
    end
  end
end
