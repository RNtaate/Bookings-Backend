class MassageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :price, :duration, :massage_image

  def massage_image
    if object.massage_image.attached?
      {
        url: rails_blob_url(object.massage_image)
      }
    end
  end
end
