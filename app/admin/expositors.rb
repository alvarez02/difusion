ActiveAdmin.register Expositor do
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


 # filter :nombre_expositor, :label => "Nombre"
  #filter :estado, :label => "estado"

  permit_params :nombre_expositor, :rut, :telefono, :carrera, :anio_ingreso, :correo


  index :download_links => false do
    column :nombre_expositor
    column :rut
    column :telefono
    column :carrera
    column :anio_ingreso
    column :correo
    actions
  end

  show :title => "Expositor " do
    expositor = Expositor.find(params[:id])
    panel "Expositor" do
      attributes_table_for expositor do
        row :nombre_expositor
        row :rut
        row :telefono
        row :carrera
        row :anio_ingreso
        row :correo
      end
    end
  end


  form do |f|
    f.inputs "Expositor" do
      #usuario = current_active_admin_user

      # f.input :senal, collection: Senal.all.collect {|c| ["#{c.codigo + " " + c.nombre.to_s}", c.id]}, as: :select

      f.input :nombre_expositor
      f.input :rut
      f.input :telefono
      f.input :carrera
      f.input :anio_ingreso
      f.input :correo


    end
    f.actions
  end

    end
