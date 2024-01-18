require 'stripe'
class StripeService

    Stripe.api_key = 'sk_test_51ORUrUSIVXA0jOhG6s0Xm3zD5R0ijb6HM3uWts5WkWVRR1nNXlpV5kxtcjilkUwQpX5T1O9T79o6xgJ2KMh4KOkA00Bj4W2Crp'

    def self.find_or_create_customer(customer)
        debugger
        Stripe.api_key = 'sk_test_51ORUrUSIVXA0jOhG6s0Xm3zD5R0ijb6HM3uWts5WkWVRR1nNXlpV5kxtcjilkUwQpX5T1O9T79o6xgJ2KMh4KOkA00Bj4W2Crp'
        if customer.stripe_customer_id.present?
            stripe_customer = Stripe::Customer.retrieve(customer.stripe_customer_id)
        else
            ####
            stripe_customer = Stripe::Customer.create({
                name: customer.user_name,
                email: customer.user_email
            })
            debugger
            customer.update(stripe_customer_id: stripe_customer.id)
        end
        stripe_customer
    end

      #################
    #   def self.get_token(params)
    #         Stripe::Token.create({
    #         card: {
    #             # brand: params['card_type'],
    #             number: params['card_number'].to_s,
    #             exp_month: params['card_exp_month'],
    #             exp_year: params['card_exp_year'],
    #             cvc: params['card_cvv'],
    #         },
    #         })
    #     end





     def self.create_stripe_customer_card(params, stripe_customer)
        debugger
        # token = get_token(params)
       token = "tok_visa"
        Stripe::Customer.create_source(
                stripe_customer,
                {source: token}
                # {source: token.id}
            )
      end

    


      def self.create_on_stripe_charge(amount, stripe_customer_id, card_id)
        debugger
        Stripe.api_key = 'sk_test_51ORUrUSIVXA0jOhG6s0Xm3zD5R0ijb6HM3uWts5WkWVRR1nNXlpV5kxtcjilkUwQpX5T1O9T79o6xgJ2KMh4KOkA00Bj4W2Crp'
        # payment_intent = Stripe::PaymentIntent.confirm('pmc_1OWbatSIVXA0jOhGX5tsB8o1')

        Stripe::PaymentIntent.create({
          amount: amount,
          currency: 'inr',
          customer: stripe_customer_id,
          payment_method: card_id,
        #   payment_method_types: ['card'],
        })
       
       end


    end