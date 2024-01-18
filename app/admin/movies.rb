ActiveAdmin.register Movie do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :genre, :duration, :release_date, theatre_ids: []
  #

  form do |f|
    f.inputs 'Movie Details' do
      f.input :title
      f.input :description
      f.input :genre
      f.input :duration
      f.input :release_date
      f.input :theatres, as: :check_boxes
    end
    f.actions
  end
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :genre, :duration, :release_date]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
