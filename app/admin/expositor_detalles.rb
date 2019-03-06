ActiveAdmin.register ExpositorDetalle do
  actions :all, :except => [:destroy,:create, :edit, :update, :new]
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
  filter :expositor_id, :label => "Nombre Expositor"
  filter :carrera, :label => "Carrera Expositor"
  filter :estado, :label => "Estado Expositor"

  # filter :nombre_expositor, :label => "Nombre"
  #filter :estado, :label => "estado"

  permit_params :aceptados, :rechazados, :fallos,
                expositor_attributes: [:expositor_id,:nombre_expositor]


  index :download_links => false do
    column :expositor_id
    column :aceptados
    column :rechazados
    column :fallos
    actions
  end

  show :title => "Detalles " do
    detalle = ExpositorDetalle.find(params[:id])
    panel "Expositor Detalle" do
      attributes_table_for detalle do
        row :expositor_id
        row :aceptados
        row :rechazados
        row :fallos

      end
    end
  end


  form do |f|
    f.inputs "Expositor detalles" do


      f.input :aceptados
      f.input :rechazados
      f.input :fallos





    end
    f.actions
  end

end
