ActiveAdmin.register Interesado do
  menu priority: 11

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


  filter :comuna, :label => "comuna"
  filter :colegio, :label => "colegio"
  filter :curso, :label => "curso"

  permit_params :nombre_interesado, :apellido_paterno, :apellido_materno, :rut, :comuna, :correo, :colegio, :curso, :carrera1, :carrera2, :carrera3, :carrera4


  index :download_links => true do
              column :nombre_interesado
              column :apellido_paterno
              column :apellido_materno
              column :rut
              column :comuna
              column :correo
              column :colegio
              column :curso
              column :carrera1
              column :carrera2
              column :carrera3
              column :carrera4
              actions

  end


  show :title => "Interesado " do
    interesado = Interesado.find(params[:id])
    panel "Interesado" do
      attributes_table_for interesado do
        row :nombre_interesado
        row :apellido_paterno
        row :apellido_materno
        row :rut
        row :comuna
        row :correo
        row :colegio
        row :curso
        row :carrera1
        row :carrera2
        row :carrera3
        row :carrera4

      end
    end
  end


  form do |f|
    f.inputs "Interesado" do
      #usuario = current_active_admin_user

      # f.input :senal, collection: Senal.all.collect {|c| ["#{c.codigo + " " + c.nombre.to_s}", c.id]}, as: :select




      f.input :nombre_interesado
      f.input :apellido_paterno
      f.input :apellido_materno
      f.input :rut
      f.input :comuna
      f.input :correo
      f.input :colegio
      f.input :curso
      f.input :carrera1, collection: {'Ingenieria Civil en Computacion': 'Ingenieria Civil en Computacion','Ingenieria en Informatica': 'Ingenieria en Informatica','Administracion Publica':'Administracion Publica','Arquitectura': 'Arquitectura','Bachillerato en Ciencias de la ingenieria': 'Bachillerato en Ciencias de la ingenieria','Contador Publico y Auditor': 'Contador Publico y Auditor', 'Dibujante Proyectista': 'Dibujante Proyectista', 'Diseño en Comunicacion Visual': 'Diseño en Comunicacion Visual', 'Diseño Industrial': 'Diseño Industrial','Ingenieria Civil Electronica':'Ingenieria Civil Electronica',
                                      'Ingenieria Civil en Mecanica': 'Ingenieria Civil en Mecanica','Ingenieria Civil en Obras Civiles': 'Ingenieria Civil en Obras Civiles','Ingenieria Civil en Prevencion de Riesgos y Medio Ambiente': 'Ingenieria Civil en Prevencion de Riesgos y Medio Ambiente',
                                      'Ingenieria Civil Industrial': 'Ingenieria Civil Industrial','Ingenieria Comercial': 'Ingenieria Comercial','Ingenieria en Administracion Agroindustrial': 'Ingenieria en Administracion Agroindustrial', 'Ingenieria en Biotecnologia': 'Ingenieria en Biotecnologia ','Ingenieria en Comercio Internacional': 'Ingenieria en Comercio Internacional',
                                      'Ingenieria en Construccion': 'Ingenieria en Construccion ','Ingenieria en Geomensura': 'Ingenieria en Geomensura ','Ingenieria en Gestion Turistica ': 'Ingenieria en Gestion Turistica','Ingenieria en Industria Alimentaria': 'Ingenieria en Industria Alimentaria','Ingenieria en Quimica ': 'Ingenieria en Quimica','Ingenieria en Transporte y Transito': 'Ingenieria en Transporte y Transito ','Ingenieria Industrial': 'Ingenieria Industrial','Quimica Industrial': 'Quimica Industrial',
                                      'Trabajo Social': 'Trabajo Social' }
      f.input :carrera2, collection: {'Ingenieria Civil en Computacion': 'Ingenieria Civil en Computacion','Ingenieria en Informatica': 'Ingenieria en Informatica','Administracion Publica':'Administracion Publica','Arquitectura': 'Arquitectura','Bachillerato en Ciencias de la ingenieria': 'Bachillerato en Ciencias de la ingenieria','Contador Publico y Auditor': 'Contador Publico y Auditor', 'Dibujante Proyectista': 'Dibujante Proyectista', 'Diseño en Comunicacion Visual': 'Diseño en Comunicacion Visual', 'Diseño Industrial': 'Diseño Industrial','Ingenieria Civil Electronica':'Ingenieria Civil Electronica',
                                      'Ingenieria Civil en Mecanica': 'Ingenieria Civil en Mecanica','Ingenieria Civil en Obras Civiles': 'Ingenieria Civil en Obras Civiles','Ingenieria Civil en Prevencion de Riesgos y Medio Ambiente': 'Ingenieria Civil en Prevencion de Riesgos y Medio Ambiente',
                                      'Ingenieria Civil Industrial': 'Ingenieria Civil Industrial','Ingenieria Comercial': 'Ingenieria Comercial','Ingenieria en Administracion Agroindustrial': 'Ingenieria en Administracion Agroindustrial', 'Ingenieria en Biotecnologia': 'Ingenieria en Biotecnologia ','Ingenieria en Comercio Internacional': 'Ingenieria en Comercio Internacional',
                                      'Ingenieria en Construccion': 'Ingenieria en Construccion ','Ingenieria en Geomensura': 'Ingenieria en Geomensura ','Ingenieria en Gestion Turistica ': 'Ingenieria en Gestion Turistica','Ingenieria en Industria Alimentaria': 'Ingenieria en Industria Alimentaria','Ingenieria en Quimica ': 'Ingenieria en Quimica','Ingenieria en Transporte y Transito': 'Ingenieria en Transporte y Transito ','Ingenieria Industrial': 'Ingenieria Industrial','Quimica Industrial': 'Quimica Industrial',
                                      'Trabajo Social': 'Trabajo Social' }
      f.input :carrera3, collection: {'Ingenieria Civil en Computacion': 'Ingenieria Civil en Computacion','Ingenieria en Informatica': 'Ingenieria en Informatica','Administracion Publica':'Administracion Publica','Arquitectura': 'Arquitectura','Bachillerato en Ciencias de la ingenieria': 'Bachillerato en Ciencias de la ingenieria','Contador Publico y Auditor': 'Contador Publico y Auditor', 'Dibujante Proyectista': 'Dibujante Proyectista', 'Diseño en Comunicacion Visual': 'Diseño en Comunicacion Visual', 'Diseño Industrial': 'Diseño Industrial','Ingenieria Civil Electronica':'Ingenieria Civil Electronica',
                                      'Ingenieria Civil en Mecanica': 'Ingenieria Civil en Mecanica','Ingenieria Civil en Obras Civiles': 'Ingenieria Civil en Obras Civiles','Ingenieria Civil en Prevencion de Riesgos y Medio Ambiente': 'Ingenieria Civil en Prevencion de Riesgos y Medio Ambiente',
                                      'Ingenieria Civil Industrial': 'Ingenieria Civil Industrial','Ingenieria Comercial': 'Ingenieria Comercial','Ingenieria en Administracion Agroindustrial': 'Ingenieria en Administracion Agroindustrial', 'Ingenieria en Biotecnologia': 'Ingenieria en Biotecnologia ','Ingenieria en Comercio Internacional': 'Ingenieria en Comercio Internacional',
                                      'Ingenieria en Construccion': 'Ingenieria en Construccion ','Ingenieria en Geomensura': 'Ingenieria en Geomensura ','Ingenieria en Gestion Turistica ': 'Ingenieria en Gestion Turistica','Ingenieria en Industria Alimentaria': 'Ingenieria en Industria Alimentaria','Ingenieria en Quimica ': 'Ingenieria en Quimica','Ingenieria en Transporte y Transito': 'Ingenieria en Transporte y Transito ','Ingenieria Industrial': 'Ingenieria Industrial','Quimica Industrial': 'Quimica Industrial',
                                      'Trabajo Social': 'Trabajo Social' }
      f.input :carrera4, collection: {'Ingenieria Civil en Computacion': 'Ingenieria Civil en Computacion','Ingenieria en Informatica': 'Ingenieria en Informatica','Administracion Publica':'Administracion Publica','Arquitectura': 'Arquitectura','Bachillerato en Ciencias de la ingenieria': 'Bachillerato en Ciencias de la ingenieria','Contador Publico y Auditor': 'Contador Publico y Auditor', 'Dibujante Proyectista': 'Dibujante Proyectista', 'Diseño en Comunicacion Visual': 'Diseño en Comunicacion Visual', 'Diseño Industrial': 'Diseño Industrial','Ingenieria Civil Electronica':'Ingenieria Civil Electronica',
                                      'Ingenieria Civil en Mecanica': 'Ingenieria Civil en Mecanica','Ingenieria Civil en Obras Civiles': 'Ingenieria Civil en Obras Civiles','Ingenieria Civil en Prevencion de Riesgos y Medio Ambiente': 'Ingenieria Civil en Prevencion de Riesgos y Medio Ambiente',
                                      'Ingenieria Civil Industrial': 'Ingenieria Civil Industrial','Ingenieria Comercial': 'Ingenieria Comercial','Ingenieria en Administracion Agroindustrial': 'Ingenieria en Administracion Agroindustrial', 'Ingenieria en Biotecnologia': 'Ingenieria en Biotecnologia ','Ingenieria en Comercio Internacional': 'Ingenieria en Comercio Internacional',
                                      'Ingenieria en Construccion': 'Ingenieria en Construccion ','Ingenieria en Geomensura': 'Ingenieria en Geomensura ','Ingenieria en Gestion Turistica ': 'Ingenieria en Gestion Turistica','Ingenieria en Industria Alimentaria': 'Ingenieria en Industria Alimentaria','Ingenieria en Quimica ': 'Ingenieria en Quimica','Ingenieria en Transporte y Transito': 'Ingenieria en Transporte y Transito ','Ingenieria Industrial': 'Ingenieria Industrial','Quimica Industrial': 'Quimica Industrial',
                                      'Trabajo Social': 'Trabajo Social' }

    end
    f.actions
  end








end
