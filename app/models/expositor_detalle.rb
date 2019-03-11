class ExpositorDetalle < ApplicationRecord
  belongs_to :expositor ,dependent: :destroy
  self.table_name='expositor_detalles'
end
