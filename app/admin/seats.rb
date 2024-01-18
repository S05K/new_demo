ActiveAdmin.register Seat do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :row, :number, :show_id, :theatre_id
  #
  # or
  form do |f|
    f.inputs 'Seat Details' do
      f.input :row
      f.input :number
      f.input :theatre
      f.input :show, as: :select, collection: Show.all.map { |s| [ s.id] }
    end
    f.actions
  end
  #
  # permit_params do
  #   permitted = [:row, :number, :show_id, :theatre_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
