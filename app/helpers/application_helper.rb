module ApplicationHelper

  def login_helper
    if current_user.is_a?(User)
      link_to "Logout", destroy_user_session_path, method: :delete
   else
     #we have to put these together in one string because Ruby will only act on the last item is a logic arguments and,
     # without the concatenation of these two arguments, we'll never see the Register option
      (link_to "Register ", new_user_registration_path) + "<br>".html_safe + (link_to " Login", new_user_session_path)
   end
  end
  def source_helper(layout_name)
      if session[:source]
        greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
        content_tag(:p, greeting, class: "source-greeting")
      end
  end
end
