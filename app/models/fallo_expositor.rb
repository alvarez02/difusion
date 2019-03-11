class FalloExpositor < ApplicationRecord
  has_many :fallo_expositor_actividads ,dependent: :destroy
  accepts_nested_attributes_for :fallo_expositor_actividads ,dependent: :destroy

  has_many :expositors, through: :fallo_expositor_actividads ,dependent: :destroy

end
