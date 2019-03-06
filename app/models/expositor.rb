class Expositor < ApplicationRecord
  has_many :activdad_expositors
  has_many :expositor_horarios
  has_many :expositor_detalles
  has_many :asistencias
  has_many :fallo_expositors, through: :fallo_expositor_actividads
  accepts_nested_attributes_for :expositor_horarios, allow_destroy: true
  accepts_nested_attributes_for :expositor_detalles


end
