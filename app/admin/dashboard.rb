ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{"Principal" } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do


        span ("Bienvenido al Sistema de Difusion")






        small ("Elige en la la barra alguno de los items a ingresar.")
      end
    end




    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
   sidebar :help do

      #li "Necesitas ayuda?  "
      #li "Second List First Item"
      #li "Second List Second Item"
    end
  end

