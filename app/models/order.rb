class Order < ApplicationRecord
  validates :firstname,  presence: true
  validates :lastname,  presence: true
  validates :address,  presence: true
  validates :phone,  presence: true
end
