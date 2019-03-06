class ExpositorDetalle < ApplicationRecord
  belongs_to :expositor
  self.table_name='expositor_detalles'
end
