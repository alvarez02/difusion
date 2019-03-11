class Asistencia < ApplicationRecord
  self.table_name = "asistencias"

  belongs_to :expositor
  belongs_to :actividad
  validates :fecha, :expositor_id, :actividad_id, :presence => { message: "No puede dejarse vacío" }
end

