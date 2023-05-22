class Product < ApplicationRecord
  has_many :product_orders
  has_many :orders, through: :product_orders

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
