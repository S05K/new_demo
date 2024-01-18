ActiveAdmin.register Theatre do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  permit_params :name, :location ,  movie_ids: [], show_ids: []
  #
  # filter :shows, collection: Show.all.map { |s| [s.date, s.id, s.time] }
  filter :shows_id_in, as: :select, collection: -> { Show.pluck(:id) }


  form do |f|
    f.inputs 'Theater Details' do
      f.input :name
      f.input :location
      f.input :movies, as: :check_boxes
      f.input :shows, as: :check_boxes
    end
    f.actions
  end
  # or
  #
  # permit_params do
  #   permitted = [:name, :location]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
