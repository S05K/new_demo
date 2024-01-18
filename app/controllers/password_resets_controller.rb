class PasswordResetsController < ApplicationController
    # before_action :authenticate_request, except:[:create] 
    skip_before_action :authenticate_request#, except: [:create]


    def new 
        
    end

    def create
        debugger
        @user = User.find_by(user_email: params[:user_email])
        if @user.present?
            #send email

            PasswordMailer.with(user: @user).reset.deliver_now
        else

        end
    end

    def edit
        @user = User.find_signed(params[:token], purpose: "password_reset")
    end


    def update
        @user = User.find_signed(params[:token], purpose: "password_reset")
        if @user.update(password_params)
          puts "Succesfull"
        else
            render :edit
        end
    end


    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
