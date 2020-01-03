class Star < ApplicationRecord
  belongs_to :galaxy
  has_many :planets
  mount_uploader :image, ImageUploader
end
