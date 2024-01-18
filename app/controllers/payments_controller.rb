require 'stripe'
class PaymentsController < ApplicationController

  skip_before_action :verify_authenticity_token
    #  def new
    #     @theatre = Theatre.find(params[:id])
    #     @show = Show.find(params[:id])
    #     @user = current_user 
    #     Stripe.api_key = 'sk_test_51ORUrUSIVXA0jOhG6s0Xm3zD5R0ijb6HM3uWts5WkWVRR1nNXlpV5kxtcjilkUwQpX5T1O9T79o6xgJ2KMh4KOkA00Bj4W2Crp'
    #   end


    #   def create
    #     debugger
    #     Stripe.api_key = "sk_test_51ORUrUSIVXA0jOhG6s0Xm3zD5R0ijb6HM3uWts5WkWVRR1nNXlpV5kxtcjilkUwQpX5T1O9T79o6xgJ2KMh4KOkA00Bj4W2Crp"
    #     # stripe_token = params[:stripeToken]
    #     # # params[:data][:attributes][:stripe_token]
    #     stripe_token = params[:data][:attributes][:stripe_token]
    #     # amount = params[:amount]
    #     amount = calculate_amount() # Define a method to calculate the payment amount
    #     customer = Stripe::Customer.create(
    #       email: params[:stripeEmail],
    #       source: params[:stripeToken]
    #     )
    #     charge = Stripe::Charge.create(
    #       amount: amount,
    #       currency: 'INR',
    #       source: stripe_token,
    #       description: 'Rails Stripe customer',
    #     )
    
    #     # Save payment details
    #     @payment = current_user.payments.create!(
    #       show_id: params[:show_id],
    #       amount: amount,
    #       transaction_id: charge.id
    #     )
    
    #     # Redirect or render as needed
    #     redirect_to root_path, notice: 'Payment successful!'
    #   rescue Stripe::CardError => e
    #     # Handle card errors
    #     flash[:error] = e.message
    #     render :new
    #   end


    def create_customer
      debugger
      customer = User.create({
          user_name: params[:user_name],
          user_email: params[:user_email],
          user_number: params[:user_number]
      })
      stripe_customer = StripeService.find_or_create_customer(customer)
      render json: {customer: customer, stripe_customer: stripe_customer}
  end


  def create
    debugger
    # @current_user = User.find(params[:id])
    if @customer = User.find_by(id: params['data']['user_id'])
      ###
        @stripe_customer_id = @customer.stripe_customer_id
        @amount = params['data']['total']
        begin
          @card = StripeService.create_stripe_customer_card(card_token_parmas, @stripe_customer_id)
        rescue StandardError => e
          return render json: { result: e.message }, status: 404
        end
        @charge = StripeService.create_on_stripe_charge(@amount, @stripe_customer_id, @card.id)
        render json: @charge
      else
        render json: { errors: 'Customer not found!.' }
      end
  end






  def calculate_amount
  show = Show.find(params["data"]["attributes"]["show_id"])
  seats_id = params["data"]["attributes"]["seat_ids"]
  total = 0
  seats_id.each do |id|
    if id.present?
      seats = show.seats.where(id: id)
      total_amount = seats.sum { |seat| show.price}
      total += total_amount
    else
      return render json: { error: 'No selected seats specified' }
    end
  end 
  render json: { total_amount: total }
 
 
end

private
def card_token_parmas
    params.require(:data).permit(:card_number, :card_exp_month, :card_exp_year, :card_cvv,:user_id, :total)
end    



end
