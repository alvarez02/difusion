class Material < ApplicationRecord
  has_many :actividad_materials ,dependent: :destroy
  validates :nombre_material, :cantidad, :presence => { message: "No puede dejarse vacío" }
end
