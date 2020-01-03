class Galaxy < ApplicationRecord
  belongs_to :supercluster
  has_many :stars
  mount_uploader :image, ImageUploader
end
