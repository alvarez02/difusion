class ExpositorHorario < ApplicationRecord
  belongs_to :expositor ,dependent: :destroy
  belongs_to :horario   ,dependent: :destroy
end
