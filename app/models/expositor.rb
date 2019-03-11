class Expositor < ApplicationRecord
  has_many :activdad_expositors ,dependent: :destroy
  has_many :expositor_horarios  ,dependent: :destroy
  has_many :expositor_detalles  ,dependent: :destroy
  has_many :asistencias       ,dependent: :destroy
  has_many :comentarios       ,dependent: :destroy
  #has_many :fallo_expositors, through: :fallo_expositor_actividads ,dependent: :destroy
  has_many :horarios, through: :activdad_expositors ,dependent: :destroy
  has_many :horarios, through: :expositor_horarios ,dependent: :destroy
  accepts_nested_attributes_for :expositor_horarios, allow_destroy: true
  accepts_nested_attributes_for :expositor_detalles
  validates :estado,:nombre_expositor,:rut ,:telefono,:carrera,:anio_ingreso,:correo, :presence => { message: "No puede dejarse vacío" }

end
