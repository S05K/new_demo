ActiveAdmin.register Payment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :seat_id, :show_id, :total
  #
  # or
  form do |f|
    f.inputs 'Payment Details' do
      f.input :user, as: :select, collection: User.all.map { |s| [ s.id] }
      f.input :show, as: :select, collection: Show.all.map { |s| [ s.id] }
      f.input :seat, as: :select, collection: Seat.all.map { |s| [ s.id] }
      f.input :total
    end
    f.actions
  end
  #
  # permit_params do
  #   permitted = [:user_id, :seat_id, :show_id, :total]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
