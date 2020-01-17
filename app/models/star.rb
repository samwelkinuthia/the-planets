class Star < ApplicationRecord
  belongs_to :galaxy
  has_many :planets, dependent: :destroy
  mount_uploader :image, ImageUploader
end
