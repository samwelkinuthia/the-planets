class Galaxy < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :supercluster
  has_many :stars
  mount_uploader :image, ImageUploader
end
