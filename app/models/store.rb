class Store < ApplicationRecord
  has_many :product_stores
  has_many :products, through: :product_stores

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: true

end
