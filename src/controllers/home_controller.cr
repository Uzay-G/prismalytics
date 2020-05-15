class HomeController < ApplicationController
  def index
    if current_user
      render("user/dashboard.slang")
    else
      render("index.slang")
    end
  end
end
