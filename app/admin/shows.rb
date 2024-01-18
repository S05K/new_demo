ActiveAdmin.register Show do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  
  permit_params :theatre_id, :date, :time, :price
  # 
  # or
  # form do |f|
  #   f.inputs 'Show Details' do
  #     f.input :date
  #     f.input :time
  #     # f.input :theatres, as: :check_boxes 
  #   end
  #   f.actions
  # end
  #
  # permit_params do
  #   permitted = [:theatre_id, :date, :time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
