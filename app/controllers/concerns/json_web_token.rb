require "jwt"

module JsonWebToken
    extend ActiveSupport::Concern
    SECRET_KEY = Rails.application.secret_key_base

    def jwt_encode(payload, exp = 7.days.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end

    # def jwt_decode(token)
    #    debugger
    #     decoded = JWT.decode(token, SECRET_KEY)
    #     HashWithIndifferentAccess.new decoded
    # end
   

    def jwt_decode(token)
        return nil if token.blank?
        begin
          decoded = JWT.decode(token, SECRET_KEY)
          HashWithIndifferentAccess.new(decoded)
        rescue JWT::DecodeError => e
          # Handle the JWT decode error
          puts "JWT Decode Error: #{e.message}"
          nil  # Return nil or handle accordingly
        end
      end
      
end