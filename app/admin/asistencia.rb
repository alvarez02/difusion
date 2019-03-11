ActiveAdmin.register Asistencia do
  menu priority: 9

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
#  config.batch_actions = false # desabilita el boton batch
#
  permit_params :expositor_id, :fecha, :actividad_id, :asistencia, :justifica, :comentario

  filter :asistencia
  filter :expositor, collection: Expositor.all.collect {|c| ["#{c.nombre_expositor}", c.id]}, as: :select
  filter :created_at
  config.batch_actions = false # desabilita el boton batch

  index :download_links => false do
    column "Expositor" do |asistencia|
      asistencia.expositor.nombre_expositor
    end
    column "Colegio" do |asistencia|
      asistencia.actividad.nombre_colegio
    end
    column :asistencia
   # column :fecha
    column :created_at
    actions
  end





  after_create do |asistencia|
    asistencia.fecha=asistencia.created_at
    asistencia.save
  end



  form do |f|
    f.inputs "Fecha fallo" do

      #f.input :fecha, :as => :hidden, :input_html => {:value => Time.now }
      f.input :expositor_id, collection: Expositor.all.collect {|c| ["#{ c.nombre_expositor}", c.id]}, as: :select
      f.input :actividad_id, collection: Actividad.all.collect {|c| ["#{ c.nombre_colegio}", c.id]}, as: :select
      f.input :asistencia
      f.input :justifica
      f.input :comentario
    end
    f.actions
  end








  show :title => "Asistencia" do
    asistencia = Asistencia.find(params[:id])
    panel "Asistencia" do
      asistencia.expositor.nombre_expositor
      attributes_table_for asistencia do

        row "Colegio" do
          asistencia.actividad.nombre_colegio
        end
        row :asistencia
        row :fecha
        row :justifica
        row :comentario
        row :created_at
      end
    end
  end

end
