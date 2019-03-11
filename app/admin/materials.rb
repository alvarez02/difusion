ActiveAdmin.register Material, as: 'materiales' do
  menu priority: 4
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
  config.batch_actions = false # desabilita el boton batch
  filter :nombre_material, :label => "Nombre Material"
  filter :cantidad, :label => "Cantidad Material"


  # filter :nombre_expositor, :label => "Nombre"
  #filter :estado, :label => "estado"

  permit_params :nombre_material, :cantidad


  index :download_links => false do
    column :nombre_material
    column :cantidad

    actions
  end

  show :title => "Material " do
    material = Material.find(params[:id])
    panel "Material" do
      attributes_table_for material do
        row :nombre_material
        row :cantidad

      end
    end
  end


  form do |f|
    f.inputs "Material" do
      #usuario = current_active_admin_user

      # f.input :senal, collection: Senal.all.collect {|c| ["#{c.codigo + " " + c.nombre.to_s}", c.id]}, as: :select

      f.input :nombre_material
      f.input :cantidad
      

    end
    f.actions
  end
end
