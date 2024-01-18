class WelcomemailerMailer < ApplicationMailer
    def new_user_email(user)
        # u = User.find(id)
        
        mail(to: user.user_email, subject: "You got a new order!")
    end
end
