class Actividad < ApplicationRecord

  has_many :activdad_expositors
  has_many :actividad_materials, :dependent => :destroy
  has_many :fallo_expositor_actividads
  has_many :expositors, through: :activdad_expositors
  accepts_nested_attributes_for :fallo_expositor_actividads
  accepts_nested_attributes_for :activdad_expositors
  accepts_nested_attributes_for :actividad_materials, allow_destroy: true
  #has_many :fallo_expositor_actividads
  #accepts_nested_attributes_for :fallo_expositor_actividads

end
