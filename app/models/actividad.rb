class Actividad < ApplicationRecord

  has_many :activdad_expositors ,dependent: :destroy
  has_many :actividad_materials ,dependent: :destroy
  has_many :fallo_expositor_actividads, dependent: :destroy
  has_many :expositors, through: :activdad_expositors ,dependent: :destroy
  has_many :materials, through: :actividad_materials ,dependent: :destroy
  has_many :comentarios      ,dependent: :destroy
  accepts_nested_attributes_for :fallo_expositor_actividads,allow_destroy: true
  accepts_nested_attributes_for :activdad_expositors, allow_destroy: true
  accepts_nested_attributes_for :actividad_materials, allow_destroy: true
  #has_many :fallo_expositor_actividads
  #accepts_nested_attributes_for :fallo_expositor_actividads
  validate

  validates :nombre_feria, :nombre_colegio, :direccion, :comuna, :numero_expositores, :hora_inicio, :hora_termino, :fecha, :transporte, :jornada, :presence => { message: "No puede dejarse vacío" }

end
