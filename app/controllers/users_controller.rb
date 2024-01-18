class UsersController < ApplicationController
   skip_before_action :authenticate_request, only: [:create]

  def index
    @users = User.all
  end

  def create
    # debugger
    @user = User.new(user_params)
    if @user.save
      # OrderMailer.with(order: @order).new_order_email.deliver_later
      stripe_customer = StripeService.find_or_create_customer(@user)
      WelcomemailerMailer.new_user_email(@user).deliver_now
        render json: @user 
    else
      render json:"Error"
    end
  end


  # def show
  #   @user = User.find(params[:id])
  #   render json: @user
  # end




  private
  def  user_params
    params.permit(:user_name, :user_email, :user_number, :password, :password_confirmation)
  end

 
end
