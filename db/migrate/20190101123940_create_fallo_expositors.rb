class CreateFalloExpositors < ActiveRecord::Migration[5.2]
  def change
    create_table :fallo_expositors do |t|
      t.date :FechaFallo

      t.timestamps
    end
  end
end
