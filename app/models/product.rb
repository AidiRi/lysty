class Product < ApplicationRecord
  has_many :list_products
  has_many :lists, through: :list_products
  has_many :users, through: :lists

  has_many :product_stores
  has_many :stores, through: :product_stores

  validates :name, uniqueness: true, presence: true
  validates :origin, presence: true
  validates :price, presence: true

  def out_of_stock
    if self.stores.empty?
      "Out of stock"
    end
  end

  #added these methods to abstract filtering logic away from controller
  def self.in_stock(products)
    products.select {|product| !product.out_of_stock}
  end

  def self.out_of_stock(products)
    products.select {|product| product.out_of_stock}
  end

end
