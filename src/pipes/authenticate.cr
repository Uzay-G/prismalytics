class HTTP::Server::Context
  property current_user : User?
end

class CurrentUser < Amber::Pipe::Base
  def call(context)
    user_id = context.session["user_id"]?
    if user = User.find user_id
      context.current_user = user
    end
    call_next(context)
  end
end

class Authenticate < Amber::Pipe::Base
  def call(context)
    if context.current_user
      call_next(context)
    else
      context.flash[:warning] = "Please Sign In"
      context.response.headers.add "Location", "/signin"
      context.response.status_code = 302
    end
  end
end
