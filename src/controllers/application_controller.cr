require "jasper_helpers"

class ApplicationController < Amber::Controller::Base
  include JasperHelpers
  LAYOUT = "application.slang"

  def current_user
    context.current_user
  end

  private def require_user
    @user = current_user.not_nil!
  end
end
