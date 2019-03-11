class Interesado < ApplicationRecord
  validates :nombre_interesado,:apellido_paterno,:apellido_materno ,:rut,:correo,:colegio,:curso,:carrera1, :presence => { message: "No puede dejarse vacío" }
end
