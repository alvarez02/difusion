class ActivdadExpositor < ApplicationRecord
  belongs_to :actividad ,dependent: :destroy
  belongs_to :expositor ,dependent: :destroy

end
