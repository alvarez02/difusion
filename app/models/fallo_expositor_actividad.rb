class FalloExpositorActividad < ApplicationRecord

  belongs_to :actividad     ,dependent: :destroy
  belongs_to :expositor    ,dependent: :destroy
  belongs_to :fallo_expositor ,dependent: :destroy


end
