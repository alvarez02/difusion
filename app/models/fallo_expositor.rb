class FalloExpositor < ApplicationRecord
  has_many :fallo_expositor_actividads
  accepts_nested_attributes_for :fallo_expositor_actividads

  has_many :expositors, through: :fallo_expositor_actividads

end
