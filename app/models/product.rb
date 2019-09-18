class Product < ApplicationRecord
  # mount_uploader :image, ImagesUploader
  belongs_to :categoryIndex_id
end
