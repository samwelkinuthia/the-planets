class Planet < ApplicationRecord
  belongs_to :star
  mount_uploader :image, ImageUploader
end
