class HomeController < ApplicationController
  def index
    if current_user
      render("user/dashboard.ecr")
    else
      render("index.ecr")
    end
  end
end
