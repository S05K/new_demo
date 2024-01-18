class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session


    include JsonWebToken

    before_action :authenticate_request#, except:[:login] 
    
   
    
      def authenticate_request
        # debugger
        token = request.headers['token']
        # unless token.present?
          # render json: { error: 'Token not provided' }, status: :unauthorized
          return token
        # end
    
        decoded_token = jwt_decode(token)
        # Continue with authentication logic
      end
   
  

 
end
