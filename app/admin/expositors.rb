ActiveAdmin.register Expositor, as: 'expositores' do
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
  filter :nombre_expositor, :label => "Nombre Expositor"
  filter :carrera, :label => "Carrera Expositor"
  filter :estado, :label => "Estado expositor"

# filter :nombre_expositor, :label => "Nombre"
#filter :estado, :label => "estado"

  permit_params :nombre_expositor, :rut, :telefono, :carrera, :anio_ingreso, :correo, :estado,:_destroy,
               expositor_horarios_attributes: [:horario_id, :dia, :horario,:_destroy,:update],
                fallo_expositor_attribute: [:expositor_id, :nombre_expositor,:_destroy]

  after_create do |expositor|
    AdminUser.create(email: expositor.correo, password: expositor.rut, password_confirmation: expositor.rut,  rol_id: (Rol.find_by_nombre('Expositor')).id)
  end



  index :download_links => false do
    column :nombre_expositor
    column :carrera
    column :correo
    column :estado
    column "Fallos" do |expositor|
      expositor.asistencias.where(asistencia: false).where(justifica: false).size
    end
    column "Asistencias" do |expositor|
      expositor.asistencias.where(asistencia: true).size
    end
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
        row :estado
        row "Asistencia" do
          expositor.asistencias.where(asistencia: true).size
        end
        row "Fallo" do
          expositor.asistencias.where(asistencia: false).where(justifica: false).size
        end
        row "Inasistencia" do
          expositor.asistencias.where(asistencia: false).where(justifica: true).size
        end
        row "Total turnos Asignados" do
          expositor.asistencias.size
        end


      end
    end


    panel "Disponibilidad" do
      table_for expositor.horarios do
        column :dia
        column :horario
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
      f.input :carrera, collection: {'Ingenieria Civil en Computacion': 'Ingenieria Civil en Computacion', 'Ingenieria en Informatica': 'Ingenieria en Informatica', 'Administracion Publica': 'Administracion Publica', 'Arquitectura': 'Arquitectura', 'Bachillerato en Ciencias de la ingenieria': 'Bachillerato en Ciencias de la ingenieria', 'Contador Publico y Auditor': 'Contador Publico y Auditor', 'Dibujante Proyectista': 'Dibujante Proyectista', 'Diseño en Comunicacion Visual': 'Diseño en Comunicacion Visual', 'Diseño Industrial': 'Diseño Industrial', 'Ingenieria Civil Electronica': 'Ingenieria Civil Electronica',
                                     'Ingenieria Civil en Mecanica': 'Ingenieria Civil en Mecanica', 'Ingenieria Civil en Obras Civiles': 'Ingenieria Civil en Obras Civiles', 'Ingenieria Civil en Prevencion de Riesgos y Medio Ambiente': 'Ingenieria Civil en Prevencion de Riesgos y Medio Ambiente',
                                     'Ingenieria Civil Industrial': 'Ingenieria Civil Industrial', 'Ingenieria Comercial': 'Ingenieria Comercial', 'Ingenieria en Administracion Agroindustrial': 'Ingenieria en Administracion Agroindustrial', 'Ingenieria en Biotecnologia': 'Ingenieria en Biotecnologia ', 'Ingenieria en Comercio Internacional': 'Ingenieria en Comercio Internacional',
                                     'Ingenieria en Construccion': 'Ingenieria en Construccion ', 'Ingenieria en Geomensura': 'Ingenieria en Geomensura ', 'Ingenieria en Gestion Turistica ': 'Ingenieria en Gestion Turistica', 'Ingenieria en Industria Alimentaria': 'Ingenieria en Industria Alimentaria', 'Ingenieria en Quimica ': 'Ingenieria en Quimica', 'Ingenieria en Transporte y Transito': 'Ingenieria en Transporte y Transito ', 'Ingenieria Industrial': 'Ingenieria Industrial', 'Quimica Industrial': 'Quimica Industrial',
                                     'Trabajo Social': 'Trabajo Social'}
      f.input :anio_ingreso
      f.input :correo
      f.input :estado, collection: {'activo': 'activo', 'inactivo': 'inactivo'}







      f.has_many :expositor_horarios, allow_destroy: true, new_record: false ,heading: 'Horarioss', new_record: true do |a|
        a.input :horario_id, collection: Horario.all.collect {|c| ["#{ c.dia + "," + c.horario.to_s}", c.id]}, as: :select












     # f.has_many :expositor_horarios, heading: 'Dias', heading: false,
             #    allow_destroy: true,
               #  new_record: true do |a|

      #  a.input :horario_id, collection: Horario.all.collect {|c| ["#{ c.dia + "," + c.horario.to_s }", c.id]}, as: :select

        #f.has_many :fallo_expositor_actividads_attribute do |expositor_form|
        # expositor_form.input :expositor_id, collection: Expositor.all.collect {|c| ["#{ c.nombre_expositor}", c.id]}, as: :select

        #end

      end
      f.actions
    end

  end
end

