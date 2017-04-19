class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelistConcern
  include SetSourceConcern
  include CurrentUserConcern
  include DefaultPageContentConcern

  before_action:set_copyright

  def set_copyright
    @copyright = GLSViewTool::Renderer.copyright 'GreenLeafServices', 'All rights reserved'
  end
end

module GLSViewTool
  class Renderer
    def self.copyright name, msg
      "<br> &copy: #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
