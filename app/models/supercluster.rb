class Supercluster < ApplicationRecord
  has_many :galaxies, dependent: :destroy
end
