ActiveAdmin.register Actividad, as: 'actividades' do
  menu priority: 3
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


  filter :nombre_feria, :label => "Nombre Feria"
  filter :nombre_colegio, :label => "Nombre Colegio"

  permit_params :nombre_feria, :nombre_colegio, :direccion, :comuna, :contacto_colegio, :numero_expositores, :hora_inicio, :hora_termino, :fecha, :transporte, :jornada,
                activdad_expositors_attributes: [:expositor_id, :nombre_expositor],
                actividad_materials_attributes: [:material_id, :nombre_material, :cantidad, :_destroy]
#fallo_expositor_actividads: [:expositor_id, :nombre_expositor]
#  fallo_expositor_actividads: [:actividad_id, :nombre_colegio]


  after_create do |actividad|
    actividad.actividad_materials.each do |material|
      material.material.cantidad -= material.cantidad
      material.material.save
    end
    semana = ["Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"]


    if actividad.jornada == "Completo"
      horarios = Horario.where(horario: "Completo").where(dia: semana[actividad.fecha.wday])
    elsif actividad.jornada == "Mañana"
      horarios = Horario.where("horario = 'Completo' or horario = 'Mañana'").where(dia: semana[actividad.fecha.wday])
    elsif actividad.jornada == "Tarde"
      horarios = Horario.where("horario = 'Completo' or horario = 'Tarde'").where(dia: semana[actividad.fecha.wday])
    end
    expositor_horarios = ExpositorHorario.where(horario_id: horarios)
    id_expositor = []
    expositor_horarios.each do |actual|
      if !id_expositor.include?(actual.expositor_id)
        id_expositor <<  actual.expositor_id
      end
    end
    expositores = Expositor.where(id: id_expositor).shuffle[0..actividad.numero_expositores]
    expositores.each do |expositor|
      ActivdadExpositor.create(actividad_id: actividad.id, expositor_id: expositor.id)
    end
  end

  before_update do |actividad|
    actividad.actividad_materials.each do |material|
      xyz = material.material.cantidad + material.cantidad
      if xyz == material.material.cantidad - material.cantidad

      end
    end

  end


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
    column :transporte
    column :jornada
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
        row :transporte
        row :jornada
        panel "expositor" do
          table_for actividad.expositors do
            column :nombre_expositor
          end

        end
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
      f.input :jornada, collection: {'Mañana': 'Mañana', 'Tarde': 'Tarde', 'Completo': 'Completo'}
      f.input :transporte, collection: {'Micro': 'micro', 'Vehiculo institucional': 'institucional', 'Taxi': 'taxi'}
      f.has_many :activdad_expositors, heading: 'Expositores', new_record: true do |a|
        a.input :expositor_id, collection: Expositor.all.collect {|c| ["#{ c.nombre_expositor}", c.id]}, as: :select

      end

      f.has_many :actividad_materials do |material_form|
        material_form.input :material_id, collection: Material.all.collect {|c| ["#{ c.nombre_material}", c.id]}, as: :select
        material_form.input :cantidad
        #material_form.input :_destroy, :as => :boolean, :required => false, :label => 'Remove'
        material_form.input :_destroy, :as => :boolean, :label => "Destroy?"


      end


    end
    f.actions
  end
end
