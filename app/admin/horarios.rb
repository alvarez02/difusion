ActiveAdmin.register Horario do
  menu priority: 5
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

  config.batch_actions = false # desabilita el boton batch
  permit_params :dia, :horario

  index :download_links => false do
    column :dia
    column :horario

    actions
  end

  show :title => "Horario " do
    horario = Horario.find(params[:id])
    panel "Horario" do
      attributes_table_for horario do
        row :dia
        row :horario

      end
    end
  end


  form do |f|
    f.inputs "Horario" do
      #usuario = current_active_admin_user

      # f.input :senal, collection: Senal.all.collect {|c| ["#{c.codigo + " " + c.nombre.to_s}", c.id]}, as: :select
      f.input :dia, collection: { 'Lunes': 'Lunes', 'Martes': 'Martes','Miercoles': 'Miercoles','Jueves': 'Jueves','Viernes': 'Viernes','Sabado': 'Sabado','Domingo': 'Domingo' }
      f.input :horario, collection: {'Mañana': 'Mañana','Tarde': 'Tarde','Completo': 'Completo'}


      end
    f.actions
  end



end
