class Asistencia < ApplicationRecord
  self.table_name = "asistencias"

  belongs_to :expositor
  belongs_to :actividad
end

