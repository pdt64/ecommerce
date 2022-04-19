ActiveAdmin.register Record do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  permit_params :name, :description, :price, :sale, :genre_id, :image,
                record_producers_attributes: %i[id record_id producer_id producer_name _destroy]
  form do |f|
    f.semantic_errors
    f.inputs
    f.actions
    f.inputs "Producers" do
      f.input :image, as: :file
      f.has_many :record_producers, allow_destroy: true do |r|
        r.input :producer
      end
      # f.input :record_producers, as: :check_boxes, collection: RecordProducer.all
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :sale, :genre_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
