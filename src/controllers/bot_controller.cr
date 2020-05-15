class BotController < ApplicationController
    getter bot = Bot.new
    getter user = User.new

    before_action do
        only [:show, :edit, :update, :destroy, :new, :create] { require_user }
    end

    def show
        bot = Bot.find(params[:id])

        if (bot.nil?)
            flash[:danger] = "Bot not found"
            redirect_to "/"
        elsif (bot.user_id != user.id)
            flash[:danger] = "Unauthorized"
            redirect_to "/"                
        else
            render("show.slang")
        end
    end

    def new
        render("new.slang")
    end

    def edit
        bot = Bot.find(params[:id])
        if (bot.nil?)
            flash[:danger] = "Bot not found"
            redirect_to "/"
        elsif (bot.user_id != user.id)
            flash[:danger] = "Unauthorized"
            redirect_to "/"  
        else
            render("edit.slang")
        end
    end
    
    def create
        bot = Bot.new bot_params.validate!
        bot.token = Random::Secure.urlsafe_base64
        bot.user_id = user.not_nil!.id
        if bot.save
          redirect_to "/bots/#{bot.id}"
          flash[:success] = "Created Bot successfully."
        else
          flash[:danger] = bot.errors.to_s
          render "new.slang"
        end
      end

    def update
        bot = Bot.find(params[:id]).not_nil!
        if (bot.user_id != user.id)
            flash[:danger] = "Unauthorized"
            redirect_to "/"
        else
            bot.set_attributes bot_params.validate!
            if bot.save
                redirect_to "/", flash: {"success" => "User has been updated."}
            else
                flash[:danger] = "Could not update bot!"
                render "edit.slang"
            end
        end
    end

    def destroy
        bot = Bot.find(params[:id])
        if bot.nil?
            flash[:danger] = "Bot could not be found"
            redirect_to "/"
        else
            if current_user.not_nil!.id != bot.user_id
                redirect_to "/", flash: {"danger" => "You don't have permissions to delete that bot."}
            elsif bot.destroy
                redirect_to "/", flash: {"success" => "Bot has been deleted."}
            else
                redirect_to "/", flash: {"success" => "Bot could not be deleted."}
            end
        end
    end

    private def set_user
        if current_user.nil?
            flash[:info] = "You must login to access that page"
            redirect_to "/signin"
        end
      end
    
    private def bot_params
        params.validation do
            required :name
            required :prefix
        end
    end
end
