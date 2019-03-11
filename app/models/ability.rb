class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    #
    #
    if user.rol.nombre == "Administrador"
      can :read, ActiveAdmin::Page, :name => "Dashboard"
#      can [:read,:update, :create], Actividad
      can :manage, :all
    elsif user.rol.nombre = "Expositor"
      can :read,  ActiveAdmin::Page, :name => "Dashboard"
      can [:read], Actividad
      can [:read,:create,:destroy], Comentario
      can [:read], Expositor
      #can [:read], Material
      can [:read,:create], Interesado


    elsif user.rol.nombre = "Encargado"
          can :read,  ActiveAdmin::Page, :name => "Dashboard"
          can :read, AdminUser, :id => user.id
          can [:read,:create,:update], Actividad
          can [:read,:create,:update], Expositor
          can [:read,:create,:update], Material
          can [:read,:create,:update],  Asistencia
          can [:read,:create,:destroy,:update], DevolverMaterial
          can [:read,:create,:destroy,:update],  Interesado


    end
  end
end
