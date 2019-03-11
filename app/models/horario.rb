class Horario < ApplicationRecord
  has_many :expositor_horarios  ,dependent: :destroy
  has_many :horarios, through: :expositor_horarios ,dependent: :destroy
  accepts_nested_attributes_for :expositor_horarios,allow_destroy: true

end
