class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request#, only:[:create]

    # include JsonWebToken
    
   
    def login
        #  debugger
        @user = User.find_by(user_email: params[:user_email])
        if @user&.authenticate(params[:password])
            token = jwt_encode(user_id: @user.id)
            render json:{user: @user, token: token}, status: :ok
        else
            render json: {error: 'unauthorized'}, status: :unauthorized
        end
    end
end
