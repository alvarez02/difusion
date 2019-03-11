ActiveAdmin.register DevolverMaterial do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :material_id, :actividad_id, :cantidad

  filter :actividad_id, collection: Actividad.all.collect {|c| ["#{c.nombre_colegio}", c.id]}, as: :select
  filter :material_id, collection: Material.all.collect {|c| ["#{c.nombre_material}", c.id]}, as: :select
  filter :fecha
  config.batch_actions = false # desabilita el boton batch

  index :download_links => false do
    column "Material" do |devolver_material|
      devolver_material.material.nombre_material
    end
    column "Actividad" do |devolver_material|
      devolver_material.actividad.nombre_colegio
    end
    column :cantidad
    actions
  end


  after_create do |devolver_material|
    devolver_material.material.cantidad += devolver_material.cantidad
    devolver_material.material.save
  end


  form do |f|
    f.inputs "Devolver material" do

      f.input :material_id, collection: Material.all.collect {|c| ["#{ c.nombre_material}", c.id]}, as: :select
      f.input :actividad_id, collection: Actividad.all.collect {|c| ["#{ c.nombre_colegio}", c.id]}, as: :select
      f.input :cantidad
    end
    f.actions
  end


  show :title => "Devolver material" do
    devolver_material = DevolverMaterial.find(params[:id])
    panel "Devolver_material " do
      devolver_material.actividad.nombre_colegio
      attributes_table_for devolver_material do

        row "Actividad" do
          devolver_material.actividad.nombre_colegio
        end


        row "Material" do
          devolver_material.material.nombre_material
        end

        :cantidad

      end
    end
  end
end


