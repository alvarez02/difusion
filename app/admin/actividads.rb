ActiveAdmin.register Actividad do
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

  permit_params :nombre_feria, :nombre_colegio, :direccion, :comuna, :contacto_colegio, :numero_expositores, :hora_inicio, :hora_termino, :fecha


  index :download_links => false do
    column :nombre_feria
    column :nombre_colegio
    column :direccion
    column :comuna
    column :contacto_colegio
    column :numero_expositores
    column :hora_inicio
    column :hora_termino
    column :fecha
    actions
  end

  show :title => "Actividad " do
    actividad = Actividad.find(params[:id])
    panel "Actividad" do
      attributes_table_for actividad do
        row :nombre_feria
        row :nombre_colegio
        row :direccion
        row :comuna
        row :contacto_colegio
        row :numero_expositores
        row :hora_inicio
        row :hora_termino
        row :fecha

      end
    end
  end


  form do |f|
    f.inputs "Actividad" do
      #usuario = current_active_admin_user

      # f.input :senal, collection: Senal.all.collect {|c| ["#{c.codigo + " " + c.nombre.to_s}", c.id]}, as: :select

      f.input :nombre_feria
      f.input :nombre_colegio
      f.input :direccion
      f.input :comuna
      f.input :contacto_colegio
      f.input :numero_expositores
      f.input :hora_inicio
      f.input :hora_termino
      f.input :fecha


    end
    f.actions
  end
end
