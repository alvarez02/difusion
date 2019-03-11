class Comentario < ApplicationRecord

  belongs_to :expositor
  belongs_to :actividad
  validates :fecha, :comentario, :expositor_id, :actividad_id,  :presence => { message: "No puede dejarse vacío" }
end
