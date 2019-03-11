class DevolverMaterial < ApplicationRecord

  belongs_to :material
  belongs_to :actividad
 # validates :fecha, :expositor_id, :actividad_id, :presence => { message: "No puede dejarse vacío" }
end
