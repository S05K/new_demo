ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_name, :user_email, :user_number, :password_digest,:stripe_customer_id
  #
  # or
  #
  permit_params do
    permitted = [:user_name, :user_email, :user_number, :password_digest]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
  
end
