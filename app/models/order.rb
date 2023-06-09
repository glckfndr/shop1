class Order < ApplicationRecord
  has_many :product_orders
  has_many :products, through: :product_orders

  validates :firstname, :lastname, :address, :phone, presence: true  
end
