ActiveAdmin.register Comentario do
  menu priority: 12

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
#
  permit_params :expositor_id, :fecha, :actividad_id, :comentario
  config.batch_actions = false # desabilita el boton batch



  filter :expositor, collection: Expositor.all.collect {|c| ["#{c.nombre_expositor}", c.id]}, as: :select
  filter :fecha
  filter :comentario
  filter :actividad, collection: Actividad.all.collect {|c| ["#{c.nombre_colegio}", c.id]}, as: :select


  index :download_links => false do
    column "Expositor" do |comentario|
      comentario.expositor.nombre_expositor
    end
    column "Colegio" do |comentario|
      comentario.actividad.nombre_colegio
    end
    column :comentario
    column :fecha
    actions
  end

  form do |f|
    f.inputs "Comentario" do

      f.input :fecha, :as => :hidden, :input_html => {:value => Time.now}
      f.input :expositor_id, collection: Expositor.all.collect {|c| ["#{ c.nombre_expositor}", c.id]}, as: :select
      f.input :actividad_id, collection: Actividad.all.collect {|c| ["#{ c.nombre_colegio}", c.id]}, as: :select
      f.input :comentario
    end
    f.actions
  end


  show :title => "Comentario" do
    comentario = Comentario.find(params[:id])
    panel "Comentario" do
      attributes_table_for comentario do
        row "Expositor" do
          comentario.expositor.nombre_expositor
        end
        row "Colegio" do
          comentario.actividad.nombre_colegio
        end
        row :fecha
        row :comentario


      end

    end
  end


end
