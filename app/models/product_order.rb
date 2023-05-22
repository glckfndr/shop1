class ProductOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  validates product_id, order_id, presence: true  
end