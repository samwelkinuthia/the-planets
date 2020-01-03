class Star < ApplicationRecord
  belongs_to :galaxy
  mount_uploader :image, ImageUploader
end
