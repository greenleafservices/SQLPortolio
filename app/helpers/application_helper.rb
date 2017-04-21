module ApplicationHelper
  #before_action:set_copyright
  #before_action:set_repeatcopyright

  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      #we have to put these together in one string because Ruby will only act on the last item is a logic arguments and,
      # without the concatenation of these two arguments, we'll never see the Register option
       (link_to "Register ", new_user_registration_path, class: style) + " ".html_safe + (link_to " Login", new_user_session_path, class: style)
    else
        link_to "Logout", destroy_user_session_path, method: :delete, class: style
   end
  end

  def source_helper(layout_name)
      if session[:source]
        greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
        content_tag(:p, greeting, class: "source-greeting")
      end
  end

  def copyright
    GlsViewTool::Renderer.copyright 'GreenLeafServices', 'All rights reserved'
  end


  def repeatcopyright
    GlsRepeatTool::RepeatRenderer.repeatcopyright 'GreenLeafServices', 'I repeat - All rights reserved'
  end

  def copythree
    GlsCopyThree::Rendererthree.copythree 'GreenLeafServices', 'Thirty-Third times the charm?'
  end

end
